require 'rss/1.0'
require 'rss/2.0'
require 'open-uri'

class PagesController < ApplicationController
  
  EPISODE = 1
  WEATHER_WO_ID = 864342
  def home
    @title = "Looking at stuff"
    @episode = EPISODE
    
    

    @rssfeed_items = RssFeedEntry.all(:limit => 1)
    
    @yt_items = YoutubeFeedEntry.random
    
    @weather_items = update_weather( WEATHER_WO_ID )
    
    @tkw = twiter_keywords

	unless SubjectKeyword.nil?
		@keywords =  SubjectKeyword.all_by_ep(EPISODE)
		@curkeyword = SubjectKeyword.where("id = ?" , @yt_items.subject_keyword ).first
	end
	
	

  end
  
	def twiter_keywords
		c = SubjectKeyword.all_by_ep(EPISODE)
		kw = ""
		(1..c.count-1).each do |i|
			kw += "\"#{c[i].keyword}\" OR "
		end 
		kw += %Q("#poop" OR "#denverwarbler")
		return kw
	end
	
	def update_weather (wocity)
		client = Weatherman::Client.new :unit => "f"
		client.lookup_by_woeid wocity
	end
end
