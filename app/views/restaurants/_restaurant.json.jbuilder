json.extract! restaurant, :id, :resto_name, :location, :about, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
