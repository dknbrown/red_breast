require 'rss/1.0'
require 'rss/2.0'
require 'open-uri'

class PagesController < ApplicationController
  
  
  WEATHER_WO_ID = 864342
  def home
    @title = "Looking at stuff"
    
    @twitter_items = TwitterFeedEntry.all(:limit => 1, :order => "created_at desc")

    #@rssfeed_items = RssFeedEntry.all(:limit => 1)
    
    @yt_items = YoutubeFeedEntry.random
    
    @weather_items = update_weather( WEATHER_WO_ID )

	unless SubjectKeyword.nil?
		@curkeyword = SubjectKeyword.where("id = ?" , @yt_items.subject_keyword ).first
	end
	
	

  end
  

	def update_weather (wocity)
		client = Weatherman::Client.new :unit => "f"
		client.lookup_by_woeid wocity
	end
end
