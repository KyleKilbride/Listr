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

ActiveRecord::Schema.define(version: 20160229233829) do

  create_table "groups", force: :cascade do |t|
    t.string   "name",              limit: 50,  default: "Group Title", null: false
    t.integer  "number_of_members", limit: 4
    t.integer  "owner_id",          limit: 4
    t.string   "type_of_group",     limit: 255, default: "regular",     null: false
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.string   "description",       limit: 255
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "group_id", limit: 4
    t.integer "user_id",  limit: 4
  end

  add_index "groups_users", ["group_id", "user_id"], name: "index_groups_users_on_group_id_and_user_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.integer  "list_id",    limit: 4
    t.string   "name",       limit: 50
    t.string   "link",       limit: 255
    t.text     "note",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "lists", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "group_id",   limit: 4
    t.string   "name",       limit: 40, default: ""
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 50
    t.string   "email",           limit: 255, default: "", null: false
    t.string   "password",        limit: 50,  default: "", null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "password_digest", limit: 255
  end

end
