# == Schema Information
# Schema version: 20110518205024
#
# Table name: youtube_feed_entries
#
#  id                 :integer         not null, primary key
#  player_url         :string(255)
#  thumbnail_url      :string(255)
#  updated_at         :datetime
#  published_at       :string(255)
#  author             :string(255)
#  description        :text
#  title              :string(255)
#  guid               :string(255)
#  created_at         :datetime
#  vid                :string(255)
#  subject_keyword_id :integer
#

class YoutubeFeedEntry < ActiveRecord::Base
attr_accessible :player_url, :thumbnail_url, :updated_at, :published_at,
          :author, :description, :title, :vid, :tag, :subject_keyword_id
belongs_to :subject_keyword

  def self.update_entries(search_for_id)
    client = YouTubeIt::Client.new()
	search_for = SubjectKeyword.find(search_for_id)
    reply = client.videos_by(:query => search_for.keyword, :page => 1, :per_page => 5)
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
        :subject_keyword_id => search_for_id,
        :vid => entry.video_id.split(':')[-1]
		
      )
      end
    end
  end

  def self.randByEp(ep)
	
	
	allByKeyword = SubjectKeyword.rand_by_ep(ep).youtube_feed_entries
	randEntry = allByKeyword.find(:first, :offset => rand(allByKeyword.all.size-1))
  end
  
  def self.randomizeSet(items)
	
	#get random from smaller selection
	return items.find(:first, :offset => rand(items.all.size-1))	
  end
end
