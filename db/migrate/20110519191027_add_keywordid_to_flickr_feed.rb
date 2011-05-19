class AddKeywordidToFlickrFeed < ActiveRecord::Migration
  def self.up
    add_column :flickr_feeds, :subject_keyword_id, :integer
  end

  def self.down
    remove_column :flickr_feeds, :subject_keyword_id
  end
end
