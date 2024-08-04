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

ActiveRecord::Schema[7.1].define(version: 2024_08_04_044556) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "shift_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shift_id"], name: "index_availabilities_on_shift_id"
    t.index ["user_id"], name: "index_availabilities_on_user_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.integer "weekdays_start"
    t.integer "weekdays_end"
    t.integer "weekend_start"
    t.integer "weekend_end"
    t.datetime "start_at"
    t.datetime "end_at"
    t.bigint "service_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_contracts_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shifts", force: :cascade do |t|
    t.integer "start", null: false
    t.integer "end", null: false
    t.integer "status", default: 0, null: false
    t.bigint "user_id"
    t.bigint "week_id", null: false
    t.bigint "service_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "date"
    t.index ["service_id"], name: "index_shifts_on_service_id"
    t.index ["user_id"], name: "index_shifts_on_user_id"
    t.index ["week_id"], name: "index_shifts_on_week_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.string "name"
    t.string "last_name"
    t.integer "role"
    t.string "color", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weeks", force: :cascade do |t|
    t.integer "number"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number"], name: "index_weeks_on_number", unique: true
    t.index ["year"], name: "index_weeks_on_year", unique: true
  end

  add_foreign_key "availabilities", "shifts"
  add_foreign_key "availabilities", "users"
  add_foreign_key "contracts", "services"
  add_foreign_key "shifts", "services"
  add_foreign_key "shifts", "users"
  add_foreign_key "shifts", "weeks"
end
