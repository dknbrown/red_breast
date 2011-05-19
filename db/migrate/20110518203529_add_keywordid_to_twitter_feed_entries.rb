class AddKeywordidToTwitterFeedEntries < ActiveRecord::Migration
  def self.up
    add_column :twitter_feed_entries, :keyword_id, :integer
  end

  def self.down
    remove_column :twitter_feed_entries, :keyword_id
  end
end
