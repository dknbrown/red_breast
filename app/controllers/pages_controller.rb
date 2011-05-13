require 'rss/1.0'
require 'rss/2.0'
require 'open-uri'

class PagesController < ApplicationController
  def home
    @title = "Home"
    
    @yt_items = YoutubeFeedEntry.random

    @twitter_items = TwitterFeedEntry.all(:limit => 1, :order => "created_at desc")

    @rssfeed_items = RssFeedEntry.all(:limit => 1)
    
    
 
	@weather_items = get_weather(864342)

  end


	def get_weather (wocity)
		client = Weatherman::Client.new :unit => "f"
		eply = client.lookup_by_woeid wocity
	end
end
