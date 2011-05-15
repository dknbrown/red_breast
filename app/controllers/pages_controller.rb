require 'rss/1.0'
require 'rss/2.0'
require 'open-uri'

class PagesController < ApplicationController
  
  
  def home
    @title = "Home"
    
    @twitter_items = TwitterFeedEntry.all(:limit => 1, :order => "created_at desc")

    @rssfeed_items = RssFeedEntry.all(:limit => 1)
    
    @yt_items = YoutubeFeedEntry.random
 
	@weather_items = update_weather(864342)

	@keywords = SubjectKeyword.all_by_ep(1)
	@keyword = @keywords[0]
	@count = 0

  end
  



	def update_weather (wocity)
		client = Weatherman::Client.new :unit => "f"
		eply = client.lookup_by_woeid wocity
	end
end
