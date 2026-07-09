json.extract! user_desc, :id, :lname, :fname, :sname, :address, :user_id, :created_at, :updated_at
json.url user_desc_url(user_desc, format: :json)
