json.array!(@medicines) do |medicine|
  json.extract! medicine, :id, :name, :effect, :frequency
  json.url medicine_url(medicine, format: :json)
end
