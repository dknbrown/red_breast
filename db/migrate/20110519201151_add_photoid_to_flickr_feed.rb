class AddPhotoidToFlickrFeed < ActiveRecord::Migration
  def self.up
    add_column :flickr_feeds, :photo_id, :integer
  end

  def self.down
    remove_column :flickr_feeds, :photo_id
  end
end
