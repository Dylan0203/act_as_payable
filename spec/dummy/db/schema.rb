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

ActiveRecord::Schema.define(version: 2022_10_14_143256) do

  create_table "act_as_subscriptable_subscriptions", force: :cascade do |t|
    t.string "subscriptable_type"
    t.integer "subscriptable_id"
    t.string "subscriber_type"
    t.integer "subscriber_id"
    t.string "title"
    t.text "description"
    t.integer "period_type", default: 3
    t.integer "period_point", default: 1
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "USD", null: false
    t.integer "grace_period_in_days", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subscriber_type", "subscriber_id"], name: "index_act_as_subscriptable_subscriptions_on_subscriber"
    t.index ["subscriptable_type", "subscriptable_id"], name: "index_act_as_subscriptable_subscriptions_on_subscriptable"
  end

end
