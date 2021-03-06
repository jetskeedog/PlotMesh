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

ActiveRecord::Schema.define(version: 20150417235947) do

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

  create_table "brands", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "movie_id"
    t.boolean  "fictional"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "brands", ["movie_id"], name: "index_brands_on_movie_id"
  add_index "brands", ["user_id"], name: "index_brands_on_user_id"

  create_table "commons", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "commons", ["movie_id"], name: "index_commons_on_movie_id"
  add_index "commons", ["user_id"], name: "index_commons_on_user_id"

  create_table "easter_eggs", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "easter_eggs", ["movie_id"], name: "index_easter_eggs_on_movie_id"
  add_index "easter_eggs", ["user_id"], name: "index_easter_eggs_on_user_id"

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

  create_table "goofs", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "goofs", ["movie_id"], name: "index_goofs_on_movie_id"
  add_index "goofs", ["user_id"], name: "index_goofs_on_user_id"

  create_table "locations", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "movie_id"
    t.boolean  "fictional"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["movie_id"], name: "index_locations_on_movie_id"
  add_index "locations", ["user_id"], name: "index_locations_on_user_id"

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

  create_table "rs_evaluations", force: true do |t|
    t.string   "reputation_name"
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "target_id"
    t.string   "target_type"
    t.float    "value",           default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "data"
  end

  add_index "rs_evaluations", ["reputation_name", "source_id", "source_type", "target_id", "target_type"], name: "index_rs_evaluations_on_reputation_name_and_source_and_target", unique: true
  add_index "rs_evaluations", ["reputation_name"], name: "index_rs_evaluations_on_reputation_name"
  add_index "rs_evaluations", ["source_id", "source_type"], name: "index_rs_evaluations_on_source_id_and_source_type"
  add_index "rs_evaluations", ["target_id", "target_type"], name: "index_rs_evaluations_on_target_id_and_target_type"

  create_table "rs_reputation_messages", force: true do |t|
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "receiver_id"
    t.float    "weight",      default: 1.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rs_reputation_messages", ["receiver_id", "sender_id", "sender_type"], name: "index_rs_reputation_messages_on_receiver_id_and_sender", unique: true
  add_index "rs_reputation_messages", ["receiver_id"], name: "index_rs_reputation_messages_on_receiver_id"
  add_index "rs_reputation_messages", ["sender_id", "sender_type"], name: "index_rs_reputation_messages_on_sender_id_and_sender_type"

  create_table "rs_reputations", force: true do |t|
    t.string   "reputation_name"
    t.float    "value",           default: 0.0
    t.string   "aggregated_by"
    t.integer  "target_id"
    t.string   "target_type"
    t.boolean  "active",          default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "data"
  end

  add_index "rs_reputations", ["reputation_name", "target_id", "target_type"], name: "index_rs_reputations_on_reputation_name_and_target", unique: true
  add_index "rs_reputations", ["reputation_name"], name: "index_rs_reputations_on_reputation_name"
  add_index "rs_reputations", ["target_id", "target_type"], name: "index_rs_reputations_on_target_id_and_target_type"

  create_table "songs", force: true do |t|
    t.string   "title"
    t.string   "artist"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "songs", ["movie_id"], name: "index_songs_on_movie_id"
  add_index "songs", ["user_id"], name: "index_songs_on_user_id"

  create_table "technicals", force: true do |t|
    t.string   "title"
    t.string   "artist"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "technicals", ["movie_id"], name: "index_technicals_on_movie_id"
  add_index "technicals", ["user_id"], name: "index_technicals_on_user_id"

  create_table "themes", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "movie_id"
    t.boolean  "spoiler"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "themes", ["movie_id"], name: "index_themes_on_movie_id"
  add_index "themes", ["user_id"], name: "index_themes_on_user_id"

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
