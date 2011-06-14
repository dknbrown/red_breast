class ItemsController < ApplicationController

	def yt
		@epkeywords =  Episode.find(SubjectKeyword.find(params[:table_id].to_i).episode).subject_keywords
		if (params[:dir] == "0") 
			randomYoutube
		end
		
		
		if (params[:dir] == "-1") 
			pageLeft
				
		end
		
		if (params[:dir] == "1") 
			pageRight
		end
		
		respond_to do |wants|
			wants.html
			wants.js
		end
	end
	
	def fl
		@episode_label = params[:ep]
		respond_to do |wants|
			wants.html
			wants.js
		end
	end
	
	def sc
		
		respond_to do |wants|
			wants.html
			wants.js
		end
	end
	
	private
	def randomYoutube
		
		@yt_items = YoutubeFeedEntry.randByEp(SubjectKeyword.find(params[:table_id].to_i).episode)
		@curkeyword =  @yt_items.subject_keyword
	end
	
	def pageLeft
			
			if (params[:table_id].to_i > @epkeywords.first.id)
				
				@curkeyword =  @epkeywords.find(params[:table_id].to_i-1)
				@yt_items = YoutubeFeedEntry.randomizeSet(@curkeyword.youtube_feed_entries)
				
			else
				@curkeyword =  @epkeywords.last
				@yt_items = YoutubeFeedEntry.randomizeSet(@curkeyword.youtube_feed_entries)
			end
	end
	
	def pageRight
		if (params[:table_id].to_i < @epkeywords.last.id)
				@curkeyword =  @epkeywords.find(params[:table_id].to_i+1)
				@yt_items = YoutubeFeedEntry.randomizeSet(@curkeyword.youtube_feed_entries)
			else
				@curkeyword =  @epkeywords.first
				@yt_items = YoutubeFeedEntry.randomizeSet(@curkeyword.youtube_feed_entries)
		end
	end
	
end
