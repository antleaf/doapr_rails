json.extract! service, :id, :name, :description, :url, :cost, :slug, :editorial, :created_at, :updated_at
json.url service_url(service, format: :json)
