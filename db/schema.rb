# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161016202623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contributors", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "insights", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "position_trades", force: :cascade do |t|
    t.integer  "position_id"
    t.integer  "trade_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "positions", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "p_direction"
    t.integer  "aggregate_size"
    t.string   "p_product"
    t.decimal  "aggregate_price"
    t.decimal  "gain_loss"
    t.string   "status",          default: "open"
    t.decimal  "p_current_price"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.text     "content"
    t.string   "summary"
    t.date     "post_date"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "tag_id"
    t.text     "content_2"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trades", force: :cascade do |t|
    t.string   "direction"
    t.integer  "size"
    t.string   "product"
    t.date     "trade_date"
    t.decimal  "price"
    t.decimal  "current_price"
    t.integer  "user_id"
    t.string   "status",              default: "open"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "position_id"
    t.string   "option_strategy"
    t.decimal  "strategy_price"
    t.decimal  "strategy_current_px"
    t.string   "product_type"
    t.decimal  "target"
    t.decimal  "stop"
    t.decimal  "tick_value"
    t.decimal  "risk"
    t.decimal  "target_profit"
    t.decimal  "realized"
    t.date     "exit_date"
    t.decimal  "exit_price"
    t.string   "currency"
    t.decimal  "rate_at_close"
    t.decimal  "p_and_l_usd"
    t.string   "category"
  end

  create_table "uploads", force: :cascade do |t|
    t.string   "uploaded_file_file_name"
    t.string   "uploaded_file_content_type"
    t.integer  "uploaded_file_file_size"
    t.datetime "uploaded_file_updated_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "post_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role",                   default: 0
    t.string   "provider"
    t.string   "uid"
    t.string   "stripe_card_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
