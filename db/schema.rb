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

ActiveRecord::Schema.define(version: 20190815043101) do

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["restaurant_id"], name: "index_likes_on_restaurant_id", using: :btree
    t.index ["user_id", "restaurant_id"], name: "index_likes_on_user_id_and_restaurant_id_and_type", unique: true, using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "restaurants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "g_id"
    t.string   "name"
    t.string   "url"
    t.string   "pc"
    t.string   "shop_image1"
    t.string   "pr_short"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.float    "latitude",    limit: 24
    t.float    "longitude",   limit: 24
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.date     "birthday"
    t.string   "image"
    t.string   "provider"
    t.string   "uid"
  end

  add_foreign_key "likes", "restaurants"
  add_foreign_key "likes", "users"
end
