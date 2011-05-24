class CreateSoundcloudFeedEntries < ActiveRecord::Migration
  def self.up
    create_table :soundcloud_feed_entries do |t|
      t.string :title
      t.string :sound_id
      t.integer :subject_keyword_id

      t.timestamps
    end
  end

  def self.down
    drop_table :soundcloud_feed_entries
  end
end
