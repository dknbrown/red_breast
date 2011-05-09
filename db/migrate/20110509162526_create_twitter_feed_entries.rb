class CreateTwitterFeedEntries < ActiveRecord::Migration
  def self.up
    create_table :twitter_feed_entries do |t|
      t.string :profile_image_url
      t.string :from_user
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :twitter_feed_entries
  end
end
