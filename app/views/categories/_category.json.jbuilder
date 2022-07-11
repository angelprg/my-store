json.extract! category, :id, :name, :description, :image, :cover_image, :created_at, :updated_at
json.url category_url(category, format: :json)
