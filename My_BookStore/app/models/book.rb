class Book < ApplicationRecord
	after_save :save_image_info_image, if: :avatar
  def save_image_info_image
  	filename = image_info.original_filename
  	folder = "public/books/#{id}/image_info"

  	FileUtils::mkdir_p folder
  	f = File.open File.join(folder, filename), "wb"
  	f.write image_info.read()
  	f.close

  	self.image_info = nil
  	update image_info_filename: filename
  end
end
