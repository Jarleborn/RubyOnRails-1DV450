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

ActiveRecord::Schema.define(version: 20160329172621) do

  create_table "applikations", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "app_name",   limit: 20, null: false
    t.string   "app_key",               null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "applikations", ["user_id"], name: "index_applikations_on_user_id"

  create_table "creators", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "positions", force: :cascade do |t|
    t.decimal  "longitude"
    t.decimal  "latitude"
    t.string   "adress"
    t.integer  "systembolag_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "positions", ["systembolag_id"], name: "index_positions_on_systembolag_id"

  create_table "systembolags", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "creator_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "systembolags", ["creator_id"], name: "index_systembolags_on_creator_id"

  create_table "systembolagsandtags", force: :cascade do |t|
    t.integer "systembolag_id"
    t.integer "tag_id"
  end

  add_index "systembolagsandtags", ["systembolag_id"], name: "index_systembolagsandtags_on_systembolag_id"
  add_index "systembolagsandtags", ["tag_id"], name: "index_systembolagsandtags_on_tag_id"

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name",       limit: 10,                 null: false
    t.string   "password_digest",                            null: false
    t.boolean  "is_admin",                   default: false, null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

end
