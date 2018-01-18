class User < ApplicationRecord
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

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable
end
