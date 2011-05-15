# == Schema Information
# Schema version: 20110515015950
#
# Table name: youtube_feed_entries
#
#  id            :integer         not null, primary key
#  player_url    :string(255)
#  thumbnail_url :string(255)
#  updated_at    :datetime
#  published_at  :string(255)
#  author        :string(255)
#  description   :text
#  title         :string(255)
#  guid          :string(255)
#  created_at    :datetime
#  vid           :string(255)
#  tag           :string(255)
#

class YoutubeFeedEntry < ActiveRecord::Base
attr_accessible :player_url, :thumbnail_url, :updated_at, :published_at,
          :author, :description, :title, :vid, :tag

  def self.update_entries(search_for)
    client = YouTubeIt::Client.new()

    reply = client.videos_by(:query => search_for)
    entries = reply.videos

    entries.each do |entry|
    unless exists? :player_url => entry.player_url
      create!(
        :player_url => entry.player_url,
        :thumbnail_url => entry.thumbnails.first.url,
        :published_at => entry.published_at,
        :author => entry.author.name,
        :description => entry.description, 
        :title => entry.title,
        :vid => entry.video_id.split(':')[-1],
		:tag => search_for
      )
      end
    end
  end

  def self.random()
	self.find(:first, :offset => rand(self.all.size-1))	
  end
  
  def self.by_keyword(keyword)
	self.find(:first, :conditions => { :tag => keyword })
  end
end
