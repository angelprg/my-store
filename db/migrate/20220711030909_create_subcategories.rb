class CreateSubcategories < ActiveRecord::Migration[7.0]
  def change
    create_table :subcategories do |t|
      t.string :name
      t.string :description
      t.string :image
      t.string :cover_image
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
