require 'rss/1.0'
require 'rss/2.0'
require 'open-uri'

class RssFeedEntry < ActiveRecord::Base
  attr_accessible :url, :title, :description, :published_at
  
  def self.update_entries(url_for)
    source = url_for # url or local file
    content = "" # raw content of rss feed will be loaded here
    open(source) do |s| content = s.read end
    rss = RSS::Parser.parse(content, false)
    entries = rss.items
    pubdate = rss.channel.pubDate
    entries.each do |entry|
    unless exists? :url => entry.link
      create!(
        :url => entry.link,
        :title => entry.title,
        :description => entry.description,
        :published_at => pubdate
      )
      end
    end


   end

end
