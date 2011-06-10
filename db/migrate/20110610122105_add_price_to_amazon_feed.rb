class AddPriceToAmazonFeed < ActiveRecord::Migration
  def self.up
	add_column :amazon_feeds, :price, :decimal, :precision => 8, :scale => 2
  end

  def self.down
  end
end
