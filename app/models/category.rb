class Category < ApplicationRecord
  has_many :product
  scope :category, -> {pluck(:name, :id)}
end
