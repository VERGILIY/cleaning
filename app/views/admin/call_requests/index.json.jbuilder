json.array!(@call_requests) do |admin_call_request|
  json.extract! admin_call_request, :id
  json.url admin_call_request_url(admin_call_request, format: :json)
end
