json.array!(@deliverers) do |deliverer|
  json.extract! deliverer, :id, :user_id, :request_id
  json.url deliverer_url(deliverer, format: :json)
end
