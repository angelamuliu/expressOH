json.array!(@request_items) do |request_item|
  json.extract! request_item, :id, :request_id, :item_id
  json.url request_item_url(request_item, format: :json)
end
