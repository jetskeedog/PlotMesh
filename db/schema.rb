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

ActiveRecord::Schema.define(version: 20150416184207) do

  create_table "admins", force: true do |t|
    t.string   "username"
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.integer  "sign_in_count",      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",    default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genres", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "genres", ["movie_id"], name: "index_genres_on_movie_id"
  add_index "genres", ["user_id"], name: "index_genres_on_user_id"

  create_table "movies", force: true do |t|
    t.string   "title"
    t.string   "year"
    t.string   "rated"
    t.string   "duration"
    t.text     "synopsis"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "movie_poster_file_name"
    t.string   "movie_poster_content_type"
    t.integer  "movie_poster_file_size"
    t.datetime "movie_poster_updated_at"
  end

  add_index "movies", ["admin_id"], name: "index_movies_on_admin_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "name"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                   default: "", null: false
    t.string   "encrypted_password",      default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "profilepic_file_name"
    t.string   "profilepic_content_type"
    t.integer  "profilepic_file_size"
    t.datetime "profilepic_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
