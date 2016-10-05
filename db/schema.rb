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

ActiveRecord::Schema.define(version: 20160921221458) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "phone_number"
    t.integer  "degree_before"
    t.integer  "degree_after"
    t.string   "birth_name"
    t.string   "birth_date"
    t.integer  "gender"
    t.string   "birth_place"
    t.string   "birth_number"
    t.integer  "nationality"
    t.integer  "family_status"
    t.string   "bank_acc"
    t.integer  "insurance"
    t.boolean  "terms",         default: false
    t.integer  "status",        default: 0,     null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "current_step"
  end

  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.integer  "residence"
    t.string   "street"
    t.string   "street_number"
    t.string   "city"
    t.string   "zip_code"
    t.string   "state"
    t.integer  "status",           default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "addresses", ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "company_name"
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "vat_id"
    t.string   "contact_person_name"
    t.string   "contact_phone"
    t.boolean  "public",              default: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "position_id"
    t.integer  "quantity"
    t.integer  "alternates"
    t.integer  "manager_id"
    t.text     "what_bring"
    t.string   "start_date"
    t.string   "end_date"
    t.boolean  "public",      default: false
    t.integer  "status",      default: 0,     null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "jobs", ["project_id"], name: "index_jobs_on_project_id", using: :btree

  create_table "positions", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "requirements"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.integer  "manager_id"
    t.integer  "client_id"
    t.boolean  "public"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.integer  "status",     default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "status"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  add_foreign_key "accounts", "users"
  add_foreign_key "jobs", "projects"
  add_foreign_key "projects", "users"
  add_foreign_key "subscriptions", "users"
end
