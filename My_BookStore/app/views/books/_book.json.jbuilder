json.extract! book, :id, :name, :author_id, :cover, :information, :price, :kind_id, :created_at, :updated_at
json.url book_url(book, format: :json)
