class AddKeywordidToYoutubeFeedEntries < ActiveRecord::Migration
  def self.up
    add_column :youtube_feed_entries, :keyword_id, :integer
  end

  def self.down
    remove_column :youtube_feed_entries, :keyword_id
  end
end
