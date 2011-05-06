require 'rss/1.0'
require 'rss/2.0'
require 'open-uri'

class PagesController < ApplicationController
  def home
    @title = "Home"
    
    client = YouTubeIt::Client.new()

    reply = client.videos_by(:query => "warbler")
    @yt_items = reply.videos.paginate(:page => params[:page], :per_page => 5)

    search = Twitter::Search.new
    @twitter_items = search.containing("warbler").per_page(4).fetch

    source = "http://www.thewarblersnest.com/feed/" # url or local file
    content = "" # raw content of rss feed will be loaded here
    open(source) do |s| content = s.read end
    rss = RSS::Parser.parse(content, false)
    @rssfeed_items = rss.items.paginate(:page => params[:page], :per_page => 3)



  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

end
