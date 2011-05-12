require 'rss/1.0'
require 'rss/2.0'
require 'open-uri'

class PagesController < ApplicationController
  def home
    @title = "Home"
    
    @yt_items = YoutubeFeedEntry.all(:limit => 1, :order => "published_at desc")

    @twitter_items = TwitterFeedEntry.all(:limit => 1, :order => "created_at desc")

    @rssfeed_items = RssFeedEntry.all(:limit => 1)
    
    
  client = Weatherman::Client.new
  reply = client.lookup_by_woeid 862592
  
  @weather_items = reply

  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end


end
