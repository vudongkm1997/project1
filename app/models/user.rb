class User < ApplicationRecord
  attr_accessor :remember_token
  has_many :reviews
  has_many :carts
  before_save {email.downcase}
  validates :name, presence: true, length: {maximum: Settings.name_size}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A^[0-9\-\+]{10,11}$\z/i
  validates :email, presence: true, length: {maximum: Settings.email_size},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: Settings.pass_size}
  validates :phone, presence: true, format: {with: VALID_PHONE_REGEX}
  validates :address, presence: true, length: {minimum: Settings.address_size}

  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
      BCrypt::Password.create string, cost: cost
    end

    def search name
      if name
        where "email LIKE ?", "%#{name}%"
      else
        select :id, :name, :phone, :email, :address
      end
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update_attributes remember_digest: User.digest(remember_token)
  end

  def authenticated? remember_token
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password? remember_token
  end

  def forget
    update_attributes remember_digest: nil
  end

  def to_csv options = {}
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |user|
        csv << user.attributes.values_at(*column_names)
      end
    end
  end
end
