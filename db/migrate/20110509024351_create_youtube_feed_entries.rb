class CreateYoutubeFeedEntries < ActiveRecord::Migration
  def self.up
    create_table :youtube_feed_entries do |t|
      t.string :player_url
      t.string :thumbnail_url
      t.datetime :updated_at
      t.string :published_at
      t.string :author
      t.text :description
      t.string :title
      t.string :guid

      t.timestamps
    end
  end

  def self.down
    drop_table :youtube_feed_entries
  end
end
