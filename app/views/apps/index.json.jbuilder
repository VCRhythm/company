json.array!(@apps) do |app|
  json.extract! app, :id, :name, :description, :link
  json.url app_url(app, format: :json)
end
