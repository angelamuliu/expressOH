json.array!(@shops) do |shop|
  json.extract! shop, :id, :name, :address, :open_time, :close_time
  json.url shop_url(shop, format: :json)
end
