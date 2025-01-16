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

ActiveRecord::Schema[7.1].define(version: 2025_01_16_054256) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "child_chores", force: :cascade do |t|
    t.integer "child_id"
    t.integer "chore_id"
    t.boolean "active"
    t.date "date_activated"
    t.date "date_inactivated"
    t.boolean "done_mon"
    t.boolean "done_tue"
    t.boolean "done_wed"
    t.boolean "done_thu"
    t.boolean "done_fri"
    t.boolean "done_sat"
    t.boolean "done_sun"
    t.boolean "done_weekly"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "children", force: :cascade do |t|
    t.integer "parent_id"
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.date "birthdate"
    t.integer "points_available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "money_banked"
  end

  create_table "chores", force: :cascade do |t|
    t.integer "parent_id"
    t.string "title"
    t.text "description"
    t.boolean "monday"
    t.boolean "tuesday"
    t.boolean "wednesday"
    t.boolean "thursday"
    t.boolean "friday"
    t.boolean "saturday"
    t.boolean "sunday"
    t.boolean "one_timer"
    t.integer "points_awarded"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parents", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rewards", force: :cascade do |t|
    t.integer "parent_id"
    t.string "title"
    t.integer "points_cost"
    t.boolean "active"
    t.boolean "kid_requested"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "used_rewards", force: :cascade do |t|
    t.integer "child_id"
    t.integer "reward_id"
    t.date "date_approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
