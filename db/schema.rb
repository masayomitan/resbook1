# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_18_090043) do

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "image", null: false
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_images_on_restaurant_id"
  end

  create_table "more_info", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "restaurants_id", null: false
    t.boolean "cards"
    t.boolean "parking"
    t.boolean "pets"
    t.boolean "all_you_can_eat"
    t.boolean "all_you_can_edrink"
    t.boolean "tobacco"
    t.boolean "free_wifi"
    t.boolean "private_room"
    t.boolean "party"
    t.boolean "takeout"
    t.index ["restaurants_id"], name: "index_more_info_on_restaurants_id"
  end

  create_table "reservations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "restaurant_id", null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_reservations_on_restaurant_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "restaurants", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "postal_code", null: false
    t.string "address", null: false
    t.integer "tel", null: false
    t.integer "average_price", null: false
    t.string "genre", null: false
    t.string "horiday"
    t.string "drink"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "times", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "restaurants_id", null: false
    t.time "lunch_open_time"
    t.time "lunch_close_time"
    t.time "dinner_open__time"
    t.time "dinner_close_time"
    t.time "all__time"
    t.index ["restaurants_id"], name: "index_times_on_restaurants_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "images", "restaurants"
  add_foreign_key "more_info", "restaurants", column: "restaurants_id"
  add_foreign_key "reservations", "restaurants"
  add_foreign_key "reservations", "users"
  add_foreign_key "times", "restaurants", column: "restaurants_id"
end
