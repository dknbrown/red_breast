class AddPhotoidToFlickrFeed < ActiveRecord::Migration
  def self.up
    add_column :flickr_feeds, :photo_id, :string
  end

  def self.down
    remove_column :flickr_feeds, :photo_id
  end
end
