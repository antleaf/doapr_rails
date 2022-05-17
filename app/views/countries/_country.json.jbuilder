json.extract! country, :id, :name, :code, :latitude, :longitude, :continent, :created_at, :updated_at
json.url country_url(country, format: :json)
