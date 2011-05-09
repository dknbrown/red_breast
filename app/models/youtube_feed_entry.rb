# == Schema Information
# Schema version: 20110509024351
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
#

class YoutubeFeedEntry < ActiveRecord::Base
attr_accessible :player_url, :thumbnail_url, :updated_at, :published_at,
          :author, :description, :title

  def self.update_entries(search_for)
    client = YouTubeIt::Client.new()

    reply = client.videos_by(:query => search_for)
    entries = reply.videos

    entries.each do |entry|
    unless exists? :player_url => entry.player_url
      create!(
        :player_url => entry.player_url,
        :thumbnail_url => entry.thumbnails.first.url,
        :updated_at => entry.updated_at,
        :published_at => entry.published_at,
        :author => entry.author.name,
        :description => entry.description, 
        :title => entry.title
      )
      end
    end
  end

end
