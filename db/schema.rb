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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121210080538) do

  create_table "products", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.integer  "facebook_id",                :null => false
    t.string   "email",                      :null => false
    t.string   "firstname"
    t.string   "middlename"
    t.string   "lastname"
    t.date     "dateofbirth"
    t.integer  "phone"
    t.string   "gender",      :limit => 100
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "users_products_wanted_actions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.integer  "wanted_action_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "wanted_actions", :force => true do |t|
    t.string   "wanted_action"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
