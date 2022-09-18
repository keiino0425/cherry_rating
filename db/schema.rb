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

ActiveRecord::Schema.define(version: 2022_09_17_181628) do

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "user_name"
    t.string "password"
    t.integer "chip"
    t.integer "winning_streak"
    t.integer "point"
    t.integer "a_rule_game"
    t.integer "a_rule_first_place"
    t.integer "a_rule_second_place"
    t.integer "a_rule_third_place"
    t.integer "a_rule_rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "b_rule_game"
    t.integer "b_rule_first_place"
    t.integer "b_rule_second_place"
    t.integer "b_rule_third_place"
    t.integer "b_rule_rating"
  end

end
