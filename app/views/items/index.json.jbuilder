json.array!(@items) do |item|
  json.extract! item, :id, :name, :description, :user_id, :gluten
  json.url item_url(item, format: :json)
end
