class Product < ApplicationRecord
  belongs_to :category
  has_many :cart_items
  has_many :carts, through: :cart_items
  accepts_nested_attributes_for :cart_items
  has_many :reviews

  scope :load_info, -> {select :image, :id, :price, :name}

end
