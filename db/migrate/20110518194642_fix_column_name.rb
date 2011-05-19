class FixColumnName < ActiveRecord::Migration
  def self.up
        
        rename_column :youtube_feed_entries, :tag, :keyword
    end 
    def self.down
        
        rename_column :youtube_feed_entries, :keyword, :tag
    end
end
