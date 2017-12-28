class Product < ApplicationRecord
  belongs_to :category
  has_many :cart_items
  has_many :carts, through: :cart_items
  accepts_nested_attributes_for :cart_items
  has_many :reviews

  scope :load_info, -> {select :image, :id, :price, :name}
  scope :search, ->q{where "name LIKE '%#{q}%'"}
  scope :order_by_name, ->{order name: :asc}
end
