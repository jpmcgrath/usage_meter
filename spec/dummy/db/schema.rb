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

ActiveRecord::Schema[8.1].define(version: 2025_11_11_204821) do
  create_table "usage_meter_customers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "external_identifier"
    t.string "external_type"
    t.string "human_description"
    t.json "metadata"
    t.datetime "updated_at", null: false
    t.index ["external_type", "external_identifier"], name: "index_usage_meter_customers_on_external_type_and_identifier", unique: true
  end

  create_table "usage_meter_event_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "human_description"
    t.string "key", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_usage_meter_event_types_on_key", unique: true
  end
end
