json.array!(@users) do |user|
  json.extract! user, :id, :username, :pasword, :first_name, :last_name, :email, :school_id
  json.url user_url(user, format: :json)
end
