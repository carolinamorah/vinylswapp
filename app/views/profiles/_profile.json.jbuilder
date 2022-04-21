json.extract! profile, :id, :avatar, :bio, :latitude, :longitude, :state, :city, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
