json.array!(@notifications) do |notification|
  json.extract! notification, :id, :day, :opend
  json.url notification_url(notification, format: :json)
end
