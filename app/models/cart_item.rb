class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  scope :load_chart, -> from, to{group_by_day(:created_at, range:from..to)
    .sum :quantity}
  scope :load_top_sell, -> {select(:product_id, :quantity).joins(:product)
    .group("products.name").order("sum_quantity desc").limit(5).sum :quantity}
end
