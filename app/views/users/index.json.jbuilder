json.array!(@users) do |user|
  json.extract! user, :id, :email, :uid, :provider, :name, :city, :state, :phone, :oauth_token, :oauth_expires_at
  json.url user_url(user, format: :json)
end
