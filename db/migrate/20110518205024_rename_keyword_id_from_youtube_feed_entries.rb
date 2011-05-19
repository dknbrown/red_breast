class RenameKeywordIdFromYoutubeFeedEntries < ActiveRecord::Migration
  def self.up
	rename_column :youtube_feed_entries, :keyword_id, :subject_keyword_id
  end

  def self.down
  
  end
end
