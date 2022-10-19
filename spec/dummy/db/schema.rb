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

ActiveRecord::Schema.define(version: 2022_10_18_134812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "act_as_subscriptable_payment_gateways", force: :cascade do |t|
    t.string "name"
    t.string "gateway_provider"
    t.jsonb "gateway_info", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "act_as_subscriptable_payment_methods", force: :cascade do |t|
    t.bigint "payment_gateway_id"
    t.string "name"
    t.text "description"
    t.integer "payment_type"
    t.boolean "enabled", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["payment_gateway_id"], name: "index_aas_payment_methods_on_payment_gateway_id"
  end

  create_table "act_as_subscriptable_payments", force: :cascade do |t|
    t.bigint "subscription_id"
    t.bigint "payment_method_id"
    t.string "merchant_order_number"
    t.datetime "notification_sent_at"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.string "state"
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "USD", null: false
    t.jsonb "gateway_info", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["payment_method_id"], name: "index_aas_payments_on_payment_method_id"
    t.index ["subscription_id"], name: "index_aas_payments_on_subscription_id"
  end

  create_table "act_as_subscriptable_subscriptions", force: :cascade do |t|
    t.string "subscriptable_type"
    t.bigint "subscriptable_id"
    t.string "subscriber_type"
    t.bigint "subscriber_id"
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

  add_foreign_key "act_as_subscriptable_payment_methods", "act_as_subscriptable_payment_gateways", column: "payment_gateway_id"
  add_foreign_key "act_as_subscriptable_payments", "act_as_subscriptable_payment_methods", column: "payment_method_id"
  add_foreign_key "act_as_subscriptable_payments", "act_as_subscriptable_subscriptions", column: "subscription_id"
end
