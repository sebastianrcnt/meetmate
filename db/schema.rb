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

ActiveRecord::Schema.define(version: 2022_03_23_063526) do

  create_table "appointment_dates", force: :cascade do |t|
    t.date "date"
    t.integer "appointment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["appointment_id"], name: "index_appointment_dates_on_appointment_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "start_hour"
    t.integer "end_hour"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "owner_id"
  end

  create_table "availabilities", force: :cascade do |t|
    t.time "start_time"
    t.time "end_time"
    t.integer "appointment_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "appointment_date_id"
    t.index ["appointment_date_id"], name: "index_availabilities_on_appointment_date_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "kakao_user_id"
    t.string "access_token"
    t.string "refresh_token"
    t.string "profile_image_url"
    t.string "nickname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "appointment_dates", "appointments"
  add_foreign_key "availabilities", "appointment_dates"
end
