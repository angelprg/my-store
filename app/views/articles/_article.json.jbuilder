json.extract! article, :id, :name, :sku, :barcode, :slug, :description, :published, :visible, :price, :stock, :brand_id, :category_id, :subcategory_id, :created_at, :updated_at
json.url article_url(article, format: :json)
