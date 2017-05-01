class CreateKindOfBook < ActiveRecord::Migration[5.0]
  def change
    create_table :kind_of_books do |t|
      t.string :name
    end
  end
end
