class CreateFlickrFeeds < ActiveRecord::Migration
  def self.up
    create_table :flickr_feeds do |t|
      t.string :title
      t.string :url_square
      t.string :url_med
      t.string :tag

      t.timestamps
    end
  end

  def self.down
    drop_table :flickr_feeds
  end
end
