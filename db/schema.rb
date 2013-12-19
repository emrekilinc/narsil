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

ActiveRecord::Schema.define(version: 20131219021347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: true do |t|
    t.string   "access_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "errors", force: true do |t|
    t.string   "project_code"
    t.text     "message"
    t.string   "url"
    t.string   "where"
    t.datetime "occured_at"
    t.string   "browser"
    t.string   "ip"
    t.string   "backtrace"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.text     "body"
    t.string   "logo"
    t.boolean  "is_active"
    t.integer  "order"
    t.string   "primary_color"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "user_logins", force: true do |t|
    t.datetime "logged_in_at"
    t.string   "ip"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.text     "bio"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "membership_type"
    t.string   "full_name"
    t.string   "avatar"
    t.boolean  "is_closed"
    t.datetime "closed_at"
    t.string   "remember_token"
    t.string   "last_logout_at"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "last_activity_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
