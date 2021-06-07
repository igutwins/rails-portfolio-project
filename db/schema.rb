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

ActiveRecord::Schema.define(version: 2021_06_07_163155) do

  create_table "deal_teams", force: :cascade do |t|
    t.string "name"
  end

  create_table "deal_teams_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "deal_team_id", null: false
  end

  create_table "deals", force: :cascade do |t|
    t.string "name"
    t.decimal "entry_cash"
    t.decimal "interim_growth"
    t.decimal "terminal_growth"
    t.decimal "discount_rate"
    t.decimal "npv"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "industry_id", null: false
    t.integer "deal_team_id", null: false
    t.index ["deal_team_id"], name: "index_deals_on_deal_team_id"
    t.index ["industry_id"], name: "index_deals_on_industry_id"
  end

  create_table "industries", force: :cascade do |t|
    t.string "name"
  end

  create_table "titles", force: :cascade do |t|
    t.string "role"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.decimal "tenure"
    t.string "password_digest"
    t.integer "title_id"
    t.index ["title_id"], name: "index_users_on_title_id"
  end

  add_foreign_key "deals", "deal_teams"
  add_foreign_key "deals", "industries"
  add_foreign_key "users", "titles"
end
