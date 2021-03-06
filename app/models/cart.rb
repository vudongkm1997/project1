class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items
  accepts_nested_attributes_for :cart_items
  belongs_to :user
  enum status: %i(process placed)
end
