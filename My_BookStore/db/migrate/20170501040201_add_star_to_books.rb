class AddStarToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :star, :integer
  end
end
