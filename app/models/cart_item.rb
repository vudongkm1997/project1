class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  scope :load_chart, -> from, to{having("created_at >= ? and created_at <= ?",
    from, to).group(:created_at).sum :quantity}
end
