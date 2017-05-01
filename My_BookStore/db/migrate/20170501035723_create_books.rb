class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author_id
      t.text :information
      t.integer :price
      t.integer :kind_id

      t.timestamps
    end
  end
end
