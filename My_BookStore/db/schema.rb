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

ActiveRecord::Schema.define(version: 20170502030737) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string   "name"
    t.string   "author_id"
    t.text     "information"
    t.integer  "price"
    t.integer  "kind_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "cover_filename"
    t.integer  "star",           default: 3
    t.integer  "user_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.bigint   "total_money"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "detail_of_carts", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "food_id"
    t.integer  "quantity"
    t.bigint   "price"
    t.bigint   "total_money"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "kind_of_books", force: :cascade do |t|
    t.string "name"
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.integer  "seller_id"
    t.integer  "buyer"
    t.integer  "food_id"
    t.integer  "total"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "status",     default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "name"
    t.integer  "gender"
    t.string   "email"
    t.text     "address"
    t.integer  "kind_of_user",    default: 2
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.date     "birthday"
    t.string   "avatar_filename"
  end

end
