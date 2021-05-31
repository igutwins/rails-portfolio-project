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

ActiveRecord::Schema.define(version: 2021_05_31_175809) do

  create_table "deal_teams", force: :cascade do |t|
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

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "title"
    t.decimal "tenure"
    t.string "password_digest"
  end

  add_foreign_key "deals", "deal_teams"
  add_foreign_key "deals", "industries"
end
