# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150707224857) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "business_users", force: :cascade do |t|
    t.string   "business_user_name"
    t.string   "business_user_email"
    t.string   "business_user_password"
    t.integer  "business_user_cap"
    t.string   "business_user_street"
    t.string   "business_user_city"
    t.string   "business_user_state"
    t.string   "business_user_zipcode"
    t.string   "business_logo_url"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "access_token"
  end

  create_table "clients", force: :cascade do |t|
    t.string   "client_first_name"
    t.string   "client_last_name"
    t.string   "client_street_address"
    t.string   "client_city"
    t.string   "client_state"
    t.string   "client_zipcode"
    t.string   "client_primary_phone"
    t.string   "client_secondary_phone"
    t.string   "client_email"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "business_user_id"
  end

  create_table "employee_users", force: :cascade do |t|
    t.integer  "business_user_id"
    t.string   "employee_first_name"
    t.string   "employee_last_name"
    t.string   "employee_email"
    t.string   "employee_password"
    t.string   "employee_pin"
    t.string   "employee_access_rights"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "super_user",             default: false
    t.string   "access_token2"
  end

  create_table "inventory_items", force: :cascade do |t|
    t.integer  "business_user_id"
    t.string   "part_number"
    t.string   "business_part_number"
    t.string   "category"
    t.string   "inventory_item_location"
    t.string   "inventory_item_supplier"
    t.integer  "reorder_alert"
    t.integer  "order_to_quantity"
    t.boolean  "inventory_item_billable"
    t.boolean  "inventory_item_taxable"
    t.float    "inventory_item_cost"
    t.float    "inventory_item_markup"
    t.integer  "inventory_count"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.boolean  "tool"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "business_user_id"
    t.integer  "repair_order_id"
    t.integer  "client_id"
    t.string   "invoice_url"
    t.text     "invoice_status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "repair_items", force: :cascade do |t|
    t.integer  "inventory_item_id"
    t.integer  "repair_order_id"
    t.integer  "repair_item_quantity"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "repair_orders", force: :cascade do |t|
    t.integer  "business_user_id"
    t.integer  "employee_user_id"
    t.integer  "client_id"
    t.string   "repair_order_number"
    t.integer  "vehicle_id"
    t.integer  "repair_type_id"
    t.boolean  "repair_status",       default: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "vehicle_type"
    t.string   "vehicle_year"
    t.string   "vehicle_model"
    t.string   "vehicle_vin_number"
    t.string   "vehicle_color"
    t.string   "vehicle_liscense_plate"
    t.text     "vehicle_comment"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
