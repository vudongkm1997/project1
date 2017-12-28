class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.float :cart_price, default: 0
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
