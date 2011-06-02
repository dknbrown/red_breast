class ItemsController < ApplicationController

	def yt

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
		@yt_items = YoutubeFeedEntry.random
		@curkeyword =  @yt_items.subject_keyword
	end
	
	def pageLeft
			if (params[:table_id].to_i > 1)
				@curkeyword =  SubjectKeyword.find(params[:table_id].to_i-1)
				@yt_items = YoutubeFeedEntry.randomizeSet(@curkeyword.youtube_feed_entries)
				
			else
				@curkeyword =  SubjectKeyword.last
				@yt_items = YoutubeFeedEntry.randomizeSet(@curkeyword.youtube_feed_entries)
			end
	end
	
	def pageRight
		if (params[:table_id].to_i < SubjectKeyword.count)
				@curkeyword =  SubjectKeyword.find(params[:table_id].to_i+1)
				@yt_items = YoutubeFeedEntry.randomizeSet(@curkeyword.youtube_feed_entries)
			else
				@curkeyword =  SubjectKeyword.first
				@yt_items = YoutubeFeedEntry.randomizeSet(@curkeyword.youtube_feed_entries)
		end
	end
	
end
