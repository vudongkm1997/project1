class AddUserEmailToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :user_email, :string
  end
end
