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

ActiveRecord::Schema[7.1].define(version: 2024_01_09_141907) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "group_payments", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "payment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_payments_on_group_id"
    t.index ["payment_id"], name: "index_group_payments_on_payment_id"
  end

  create_table "groups", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.string "name"
    t.string "icon", default: "https://cdn.icon-icons.com/icons2/196/PNG/128/creditcard_23779.png"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_groups_on_author_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.string "name"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_payments_on_author_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "group_payments", "groups"
  add_foreign_key "group_payments", "payments"
  add_foreign_key "groups", "users", column: "author_id"
  add_foreign_key "payments", "users", column: "author_id"
end
