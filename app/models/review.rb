class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product
  scope :load_comment, -> {select :user_email, :comment, :user_id}
end
