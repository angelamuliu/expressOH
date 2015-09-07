json.array!(@deliveries) do |delivery|
  json.extract! delivery, :id, :user_id, :request_id
  json.url delivery_url(delivery, format: :json)
end
