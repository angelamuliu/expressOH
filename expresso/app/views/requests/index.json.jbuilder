json.array!(@requests) do |request|
  json.extract! request, :id, :shop_id
  json.url request_url(request, format: :json)
end
