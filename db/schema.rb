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

ActiveRecord::Schema[7.1].define(version: 2023_12_04_143718) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "nfts", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.integer "price", null: false
    t.boolean "availability", default: true, null: false
    t.text "description", default: "", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_nfts_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.datetime "begin_date"
    t.datetime "end_date"
    t.bigint "nft_id", null: false
    t.bigint "user_id", null: false
    t.string "state", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nft_id"], name: "index_transactions_on_nft_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "nfts", "users"
  add_foreign_key "transactions", "nfts"
  add_foreign_key "transactions", "users"
end
