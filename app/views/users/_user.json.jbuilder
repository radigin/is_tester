json.extract! user, :id, :user_login, :user_password, :email, :is_real_admin, :hobbies, :created_at, :updated_at
json.url user_url(user, format: :json)
