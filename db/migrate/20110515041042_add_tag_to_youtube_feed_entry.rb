class AddTagToYoutubeFeedEntry < ActiveRecord::Migration
  def self.up
    add_column :youtube_feed_entries, :tag, :string
  end

  def self.down
    remove_column :youtube_feed_entries, :tag
  end
end
