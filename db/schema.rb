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

ActiveRecord::Schema[7.0].define(version: 2023_08_19_054931) do
  create_table "airfryers", force: :cascade do |t|
    t.integer "user_id"
    t.string "af_title"
    t.string "af_image"
    t.string "af_hashtag"
    t.string "af_price"
    t.string "af_type"
    t.string "af_volume"
    t.string "af_material"
    t.decimal "af_power"
    t.string "af_control"
    t.string "af_temp"
    t.string "af_timer"
    t.string "af_automenu"
    t.string "af_rotisserie"
    t.string "af_steam"
    t.string "af_doubleheating"
    t.string "af_dry"
    t.string "af_weight"
    t.string "af_size"
    t.text "af_components"
    t.text "af_function"
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
end
