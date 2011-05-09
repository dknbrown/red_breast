class CreateRssFeedEntries < ActiveRecord::Migration
  def self.up
    create_table :rss_feed_entries do |t|
      t.string :url
      t.string :title
      t.string :description
      t.datetime :published_at

      t.timestamps
    end
  end

  def self.down
    drop_table :rss_feed_entries
  end
end
