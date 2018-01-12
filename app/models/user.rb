class User < ApplicationRecord
  has_many :reviews
  has_many :carts

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable
  validates :name, presence: true, length: {maximum: Settings.name_size}
  VALID_PHONE_REGEX = /\A^[0-9\-\+]{10,11}$\z/i
  validates :phone, presence: true, format: {with: VALID_PHONE_REGEX}
  validates :address, presence: true, length: {minimum: Settings.address_size}

  ratyrate_rater
end
