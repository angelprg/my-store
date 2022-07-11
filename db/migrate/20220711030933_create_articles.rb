class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :sku
      t.string :barcode
      t.string :slug
      t.text :description
      t.boolean :published, default: false
      t.boolean :visible, default: false
      t.integer :price
      t.integer :stock
      t.references :brand, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :subcategory, null: true, foreign_key: true

      t.timestamps
    end
  end
end
