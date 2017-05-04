class CreateDetailOfCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :detail_of_carts do |t|
      t.integer :cart_id
      t.integer :food_id
      t.integer :quantity
      t.bigint :price
      t.bigint :total_money
      t.timestamps
    end
  end
end
