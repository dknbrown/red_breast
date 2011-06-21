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

ActiveRecord::Schema.define(:version => 20110621160515) do

  create_table "amazon_feeds", :force => true do |t|
    t.integer  "subject_keyword_id"
    t.string   "title"
    t.string   "image_url"
    t.string   "page_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",              :precision => 8, :scale => 2
  end

  create_table "episodes", :force => true do |t|
    t.string   "title"
    t.string   "slogan"
    t.string   "location"
    t.string   "css"
    t.string   "bg_img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flickr_feeds", :force => true do |t|
    t.string   "title"
    t.string   "url_square"
    t.string   "url_med"
    t.string   "keyword"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subject_keyword_id"
    t.string   "photo_id"
    t.string   "page_url"
  end

  create_table "rss_feed_entries", :force => true do |t|
    t.string   "url"
    t.string   "title"
    t.string   "description"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "soundcloud_feed_entries", :force => true do |t|
    t.string   "title"
    t.string   "sound_id"
    t.integer  "subject_keyword_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subject_keywords", :force => true do |t|
    t.string   "keyword"
    t.integer  "episode_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "twitter_feed_entries", :force => true do |t|
    t.string   "profile_image_url"
    t.string   "from_user"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "keyword_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "youtube_feed_entries", :force => true do |t|
    t.string   "player_url"
    t.string   "thumbnail_url"
    t.datetime "updated_at"
    t.string   "published_at"
    t.string   "author"
    t.text     "description"
    t.string   "title"
    t.string   "guid"
    t.datetime "created_at"
    t.string   "vid"
    t.integer  "subject_keyword_id"
  end

end
