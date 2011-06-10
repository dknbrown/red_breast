class CreateAmazonFeeds < ActiveRecord::Migration
  def self.up
    create_table :amazon_feeds do |t|
      t.integer :subject_keyword_id
      t.string :title
      t.string :image_url
      t.string :page_url

      t.timestamps
    end
  end

  def self.down
    drop_table :amazon_feeds
  end
end
