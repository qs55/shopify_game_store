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

ActiveRecord::Schema.define(version: 20200609014031) do

  create_table "customers", force: :cascade do |t|
    t.string "cid"
    t.string "fname"
    t.string "lname"
    t.datetime "created_at", null: false
    t.string "email_id"
    t.string "phone"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "gender"
    t.string "ins_comp"
    t.string "ins_num"
    t.string "provider"
    t.string "card_num"
    t.string "exp_date"
    t.string "string"
    t.datetime "updated_at", null: false
    t.index ["cid"], name: "index_customers_on_cid", unique: true
  end

  create_table "order_products", force: :cascade do |t|
    t.integer "order_id"
    t.string "pid"
    t.string "pname"
    t.integer "quantity"
    t.string "glass_type"
    t.string "lense_type"
    t.string "glass_material"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_products_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "oid"
    t.string "onum"
    t.string "cid"
    t.string "cfname"
    t.string "cemail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["oid"], name: "index_orders_on_oid", unique: true
  end

  create_table "product_variations", force: :cascade do |t|
    t.integer "product_id"
    t.string "variation"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_variations_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "lense"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string "shopify_domain", null: false
    t.string "shopify_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true
  end

  create_table "variation_types", force: :cascade do |t|
    t.integer "product_id"
    t.string "material"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_variation_types_on_product_id"
  end

end
