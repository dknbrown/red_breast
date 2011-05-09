require 'rss/1.0'
require 'rss/2.0'
require 'open-uri'

class PagesController < ApplicationController
  def home
    @title = "Home"
    
    @yt_items = YoutubeFeedEntry.all(:limit => 5, :order => "published_at desc")

    @twitter_items = TwitterFeedEntry.all(:limit => 5, :order => "created_at desc")

    @rssfeed_items = RssFeedEntry.all(:limit => 5)
    

  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

end
