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

ActiveRecord::Schema[7.0].define(version: 2023_12_30_055936) do
  create_table "airfryers", force: :cascade do |t|
    t.integer "user_id"
    t.string "af_title"
    t.string "af_image"
    t.string "af_hashtag"
    t.decimal "af_price"
    t.decimal "af_was_price"
    t.decimal "af_pct"
    t.decimal "af_ratings"
    t.integer "af_rating_code"
    t.integer "af_reviews"
    t.string "af_recommend"
    t.string "af_link"
    t.string "af_oventype"
    t.string "af_baskettype"
    t.decimal "af_volume"
    t.string "af_material"
    t.string "af_stainless"
    t.decimal "af_power"
    t.string "af_control"
    t.string "af_temp"
    t.string "af_timer"
    t.string "af_cutheating"
    t.string "af_automenu"
    t.string "af_rotisserie"
    t.string "af_steam"
    t.string "af_doubleheating"
    t.string "af_dry"
    t.string "af_weight"
    t.string "af_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "airfryers_tags", id: false, force: :cascade do |t|
    t.integer "airfryer_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airfryer_id"], name: "index_airfryers_tags_on_airfryer_id"
    t.index ["tag_id"], name: "index_airfryers_tags_on_tag_id"
  end

  create_table "daily_savings", force: :cascade do |t|
    t.integer "user_id"
    t.string "ds_title"
    t.string "ds_image"
    t.string "ds_hashtag"
    t.decimal "ds_price"
    t.decimal "ds_was_price"
    t.decimal "ds_pct"
    t.decimal "ds_ratings"
    t.integer "ds_rating_code"
    t.integer "ds_reviews"
    t.string "ds_link"
    t.string "ds_rocket"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "daily_savings_tags", id: false, force: :cascade do |t|
    t.integer "daily_saving_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["daily_saving_id"], name: "index_daily_savings_tags_on_daily_saving_id"
    t.index ["tag_id"], name: "index_daily_savings_tags_on_tag_id"
  end

  create_table "homes", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "punches", force: :cascade do |t|
    t.integer "punchable_id", null: false
    t.string "punchable_type", limit: 20, null: false
    t.datetime "starts_at", precision: nil, null: false
    t.datetime "ends_at", precision: nil, null: false
    t.datetime "average_time", precision: nil, null: false
    t.integer "hits", default: 1, null: false
    t.index ["average_time"], name: "index_punches_on_average_time"
    t.index ["punchable_type", "punchable_id"], name: "punchable_index"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "airfryers_tags", "airfryers"
  add_foreign_key "airfryers_tags", "tags"
  add_foreign_key "daily_savings_tags", "daily_savings"
  add_foreign_key "daily_savings_tags", "tags"
end
