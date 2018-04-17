json.extract! request_connection, :id, :created_at, :updated_at
json.url request_connection_url(request_connection, format: :json)
