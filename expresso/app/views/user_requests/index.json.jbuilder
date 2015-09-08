json.array!(@user_requests) do |user_request|
  json.extract! user_request, :id, :user_id, :request_id
  json.url user_request_url(user_request, format: :json)
end
