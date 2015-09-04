json.array!(@users) do |user|
  json.extract! user, :id, :name, :dob, :created_at
  json.url user_url(user, format: :json)
end
