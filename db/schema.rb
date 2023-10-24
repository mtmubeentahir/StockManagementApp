# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_10_24_101901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "additional_charge_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "amount"
    t.bigint "sale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sale_id"], name: "index_additional_charge_types_on_sale_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.text "contact_information"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.decimal "weight"
    t.string "price_type"
    t.integer "stock_quantity"
    t.bigint "subcategory_id"
    t.decimal "discount"
    t.string "discount_type"
    t.decimal "additional_charges"
    t.string "additional_charges_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subcategory_id"], name: "index_products_on_subcategory_id"
  end

  create_table "purchase_products", force: :cascade do |t|
    t.bigint "purchase_id"
    t.bigint "product_id"
    t.decimal "weight"
    t.decimal "price"
    t.string "price_type"
    t.integer "quantity"
    t.decimal "discount"
    t.string "discount_type"
    t.decimal "additional_charges"
    t.string "additional_charges_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_purchase_products_on_product_id"
    t.index ["purchase_id"], name: "index_purchase_products_on_purchase_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.date "date"
    t.decimal "total_amount"
    t.decimal "discount"
    t.decimal "additional_charges"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.date "date"
    t.decimal "total_amount"
    t.decimal "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales_products", force: :cascade do |t|
    t.bigint "sale_id"
    t.bigint "product_id"
    t.decimal "weight"
    t.decimal "price"
    t.string "price_type"
    t.integer "quantity"
    t.decimal "discount"
    t.string "discount_type"
    t.decimal "additional_charges"
    t.string "additional_charges_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_sales_products_on_product_id"
    t.index ["sale_id"], name: "index_sales_products_on_sale_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "audience_type"
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.text "contact_information"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "additional_charge_types", "sales"
  add_foreign_key "products", "subcategories"
  add_foreign_key "purchase_products", "products"
  add_foreign_key "purchase_products", "purchases"
  add_foreign_key "sales_products", "products"
  add_foreign_key "sales_products", "sales"
  add_foreign_key "subcategories", "categories"
end
