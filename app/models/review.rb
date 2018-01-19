class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  scope :load_top_product,->{select(:product_id, :id).joins(:product)
      .group("products.name").order("count_id desc").limit(5).count :id}
end
