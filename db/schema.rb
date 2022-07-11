# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_07_11_030933) do
  create_table "articles", force: :cascade do |t|
    t.string "name"
    t.string "sku"
    t.string "barcode"
    t.string "slug"
    t.text "description"
    t.boolean "published", default: false
    t.boolean "visible", default: false
    t.integer "price"
    t.integer "stock"
    t.integer "brand_id", null: false
    t.integer "category_id", null: false
    t.integer "subcategory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_articles_on_brand_id"
    t.index ["category_id"], name: "index_articles_on_category_id"
    t.index ["subcategory_id"], name: "index_articles_on_subcategory_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "image"
    t.string "cover_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "image"
    t.string "cover_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "image"
    t.string "cover_image"
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  add_foreign_key "articles", "brands"
  add_foreign_key "articles", "categories"
  add_foreign_key "articles", "subcategories"
  add_foreign_key "subcategories", "categories"
end
