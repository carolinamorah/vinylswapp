json.extract! message, :id, :offer_id, :content, :created_at, :updated_at
json.url message_url(message, format: :json)
