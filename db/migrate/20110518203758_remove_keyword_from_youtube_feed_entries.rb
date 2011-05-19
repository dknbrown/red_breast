class RemoveKeywordFromYoutubeFeedEntries < ActiveRecord::Migration
  def self.up
    remove_column :youtube_feed_entries, :keyword
  end

  def self.down
    add_column :youtube_feed_entries, :keyword, :string
  end
end
