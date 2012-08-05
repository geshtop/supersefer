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

ActiveRecord::Schema.define(:version => 20120804194337) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "authors", :force => true do |t|
    t.string   "title"
    t.integer  "status_id"
    t.integer  "language_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "baskets", :force => true do |t|
    t.integer  "book_id"
    t.string   "session_id"
    t.integer  "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "books", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "publisher"
    t.integer  "subcategory_id"
    t.string   "image"
    t.decimal  "price",          :precision => 8, :scale => 2
    t.integer  "status_id"
    t.integer  "language_id"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.integer  "author_id"
    t.integer  "priority"
    t.string   "description"
    t.decimal  "weight",         :precision => 8, :scale => 2
  end

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.integer  "status_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "language_id"
  end

  create_table "languages", :force => true do |t|
    t.string   "title"
    t.integer  "status_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.string   "user_email"
    t.string   "user_first_name"
    t.string   "user_last_name"
    t.string   "user_phone"
    t.string   "user_idnum"
    t.string   "user_address"
    t.string   "user_city"
    t.string   "user_country"
    t.string   "user_zipcode"
    t.decimal  "products_price",       :precision => 8, :scale => 2
    t.integer  "products_count"
    t.decimal  "total_weight",         :precision => 8, :scale => 2
    t.integer  "shipping_id"
    t.integer  "shippingoption_id"
    t.string   "shipping_title"
    t.string   "shippingoption_title"
    t.decimal  "shipping_price",       :precision => 8, :scale => 2
    t.decimal  "grandtotal",           :precision => 8, :scale => 2
    t.boolean  "has_shipping_address"
    t.string   "shipping_first_name"
    t.string   "shipping_last_name"
    t.string   "shipping_phone"
    t.string   "shipping_address"
    t.string   "shipping_city"
    t.string   "shipping_country"
    t.string   "shipping_zipcode"
    t.integer  "status_id"
    t.integer  "language_id"
    t.boolean  "complete"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.text     "notes"
  end

  create_table "rich_rich_files", :force => true do |t|
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "rich_file_file_name"
    t.string   "rich_file_content_type"
    t.integer  "rich_file_file_size"
    t.datetime "rich_file_updated_at"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.text     "uri_cache"
    t.string   "simplified_type",        :default => "file"
  end

  create_table "shippingoptions", :force => true do |t|
    t.string   "title"
    t.integer  "shipping_id"
    t.decimal  "price",       :precision => 8, :scale => 2
    t.decimal  "from_weight", :precision => 8, :scale => 2
    t.decimal  "to_weight",   :precision => 8, :scale => 2
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "status_id"
    t.integer  "language_id"
  end

  create_table "shippings", :force => true do |t|
    t.string   "title"
    t.integer  "status_id"
    t.integer  "language_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "is_default"
  end

  create_table "statuses", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subcategories", :force => true do |t|
    t.string   "title"
    t.integer  "category_id"
    t.integer  "language_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "status_id"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.boolean  "is_admin"
    t.string   "phone"
    t.string   "idnum"
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.string   "zipcode"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
