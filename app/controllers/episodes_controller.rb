class EpisodesController < ApplicationController
	WEATHER_WO_ID = 1154781
	def index
		@title = "Looking at All Episodes"
		@weather_items = update_weather( WEATHER_WO_ID )
		@episodes = Episode.all
		@episode_label = "ALL"
		@css = "custom.css"
	end
	
	def show
		@episode = Episode.find(params[:id])
		@episode_label = @episode.id.to_s
		@title = @episode.title
		@weather_items = update_weather( @episode.location )
		@css = @episode.css
		
		@yt_items = YoutubeFeedEntry.randByEp(@episode)
		
		@tkw = twiter_keywords
		
		unless SubjectKeyword.nil?
		@keywords =  SubjectKeyword.all_by_ep(@episode)
		@curkeyword = SubjectKeyword.where("id = ?" , @yt_items.subject_keyword ).first
		end
		
	end
	
	def twiter_keywords
		c = SubjectKeyword.all_by_ep(Episode.find(params[:id]))
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
