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

ActiveRecord::Schema.define(version: 20170304073303) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.string   "name",        limit: 39, null: false
    t.text     "description"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["name"], name: "index_applications_on_name", unique: true, using: :btree
  end

  create_table "oauth_accounts", force: :cascade do |t|
    t.integer  "user_id",       null: false
    t.string   "uid",           null: false
    t.string   "provider",      null: false
    t.string   "name"
    t.string   "nickname"
    t.string   "email"
    t.string   "url"
    t.string   "image_url"
    t.string   "access_token"
    t.string   "access_secret"
    t.text     "raw_info"
    t.text     "credential"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["uid", "provider"], name: "index_oauth_accounts_on_uid_and_provider", unique: true, using: :btree
    t.index ["user_id"], name: "index_oauth_accounts_on_user_id", using: :btree
  end

  create_table "ownerships", force: :cascade do |t|
    t.string   "ownable_type",   null: false
    t.integer  "ownable_id",     null: false
    t.integer  "application_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["application_id"], name: "index_ownerships_on_application_id", using: :btree
    t.index ["ownable_type", "ownable_id"], name: "index_ownerships_on_ownable_type_and_ownable_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "login_name", null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["login_name"], name: "index_users_on_login_name", unique: true, using: :btree
  end

  add_foreign_key "oauth_accounts", "users"
  add_foreign_key "ownerships", "applications"
end
