class CreateBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :brands do |t|
      t.string :name
      t.string :description
      t.string :image
      t.string :cover_image

      t.timestamps
    end
  end
end
