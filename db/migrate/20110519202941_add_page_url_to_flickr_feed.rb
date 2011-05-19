class AddPageUrlToFlickrFeed < ActiveRecord::Migration
  def self.up
    add_column :flickr_feeds, :page_url, :string
  end

  def self.down
    remove_column :flickr_feeds, :page_url
  end
end
