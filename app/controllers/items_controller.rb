class ItemsController < ApplicationController

	def index
	
	
	
	
		if (params[:dir] == "0") 
			@yt_items = YoutubeFeedEntry.random
			@curkeyword =  @yt_items.subject_keyword
			
		end
		
		
		if (params[:dir] == "-1") 
			if (params[:table_id].to_i > 1)
				@curkeyword =  SubjectKeyword.find(params[:table_id].to_i-1)
				@yt_items = YoutubeFeedEntry.randomizeSet(@curkeyword.youtube_feed_entries)
				
			else
				@curkeyword =  SubjectKeyword.last
				@yt_items = YoutubeFeedEntry.randomizeSet(@curkeyword.youtube_feed_entries)
			end
				
		end
		
		if (params[:dir] == "1") 
			if (params[:table_id].to_i < SubjectKeyword.count)
				@curkeyword =  SubjectKeyword.find(params[:table_id].to_i+1)
				@yt_items = YoutubeFeedEntry.randomizeSet(@curkeyword.youtube_feed_entries)
			else
				@curkeyword =  SubjectKeyword.first
				@yt_items = YoutubeFeedEntry.randomizeSet(@curkeyword.youtube_feed_entries)
			end
		end
		
		respond_to do |wants|
			wants.html
			wants.js
		end
	end
	
	
end
