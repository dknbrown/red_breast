class FixTagColumnName < ActiveRecord::Migration
  def self.up
	rename_column :flickr_feeds, :tag, :keyword
  end

  def self.down
  end
end
