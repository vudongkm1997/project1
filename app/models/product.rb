class Product < ApplicationRecord
  belongs_to :category
  has_many :cart_items
  has_many :carts, through: :cart_items
  has_many :reviews
end
