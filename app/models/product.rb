class Product < ApplicationRecord
  belongs_to :category
  has_many :cart_items
  has_many :carts, through: :cart_items
  accepts_nested_attributes_for :cart_items
  has_many :reviews

  scope :load_info, -> {select :image, :id, :price, :name}
  scope :search, ->q{where "name LIKE '%#{q}%'"}
  scope :order_by_name, ->{order name: :asc}

  mount_uploader :image, ImageUploader
  validate :image_size

  def image_size
    if image.size > 5.megabytes
      errors.add :image, t("noti")
    end
  end

  validates :name, presence: true, length: {maximum: Settings.name_size}
  validates :description, presence: true,
    length: {maximum: Settings.description_size}
  validates :quantity, presence: true, numericality: { only_integer: true,
   greater_than_or_equal_to: 0}
  validates :price, presence: true, numericality: { only_float: true,
    greater_than: 0}

end
