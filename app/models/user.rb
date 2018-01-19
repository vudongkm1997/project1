class User < ApplicationRecord
  has_many :carts
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable
end
