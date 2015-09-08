json.array!(@request_items) do |request_item|
  json.extract! request_item, :id, :requiest_id, :item
  json.url request_item_url(request_item, format: :json)
end
