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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20150622183550) do
=======
ActiveRecord::Schema.define(version: 20150622193343) do
>>>>>>> 0da90eda3db3712eb77c8f391400bc27c433e43f

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pets", force: :cascade do |t|
    t.string   "name"
    t.string   "pet_type"
    t.string   "breed"
    t.string   "color"
    t.string   "weight"
    t.string   "birth_year"
    t.integer  "user_id"
    t.string   "chip_id"
    t.text     "description"
    t.string   "image_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "pets", ["user_id"], name: "index_pets_on_user_id", using: :btree

  create_table "reports", force: :cascade do |t|
    t.datetime "date_of_loss"
    t.string   "location"
    t.integer  "user_id"
    t.integer  "pet_id"
    t.text     "description"
    t.text     "notes"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "reports", ["pet_id"], name: "index_reports_on_pet_id", using: :btree
  add_index "reports", ["user_id"], name: "index_reports_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "uid"
    t.string   "provider"
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.string   "phone"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "pets", "users"
  add_foreign_key "reports", "pets"
  add_foreign_key "reports", "users"
end
