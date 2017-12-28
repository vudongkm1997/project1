class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :name
      t.text :description
      t.string :image
      t.integer :quantity
      t.float :price
      t.boolean :status

      t.timestamps
    end
  end
end
