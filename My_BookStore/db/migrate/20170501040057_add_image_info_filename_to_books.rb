class AddImageInfoFilenameToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :image_info_filename, :string
  end
end
