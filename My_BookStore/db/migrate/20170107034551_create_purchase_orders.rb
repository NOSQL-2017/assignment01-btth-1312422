class CreatePurchaseOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :purchase_orders do |t|
      t.integer :seller_id
      t.integer :buyer
      t.integer :food_id
      t.integer :total

      t.timestamps
    end
  end
end
