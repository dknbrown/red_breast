class AddVidToYoutubeFeedEntry < ActiveRecord::Migration
  def self.up
    add_column :youtube_feed_entries, :vid, :string
  end

  def self.down
    remove_column :youtube_feed_entries, :vid
  end
end
