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

ActiveRecord::Schema.define(:version => 20110519202941) do

  create_table "flickr_feeds", :force => true do |t|
    t.string   "title"
    t.string   "url_square"
    t.string   "url_med"
    t.string   "keyword"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subject_keyword_id"
    t.integer  "photo_id"
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

  create_table "subject_keywords", :force => true do |t|
    t.string   "keyword"
    t.integer  "ep"
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
