json.extract! user, :id, :username, :avatar :name, :gender, :email, :address, :kind_of_user, :created_at, :updated_at
json.url user_url(user, format: :json)
