class ItemsController < ApplicationController

	def index
	logger.debug "items index waka waka"
	
	
	
		if (params[:dir] == "0") 
			@yt_items = YoutubeFeedEntry.random
			@curkeyword =  SubjectKeyword.where("keyword = ?", @yt_items.tag).first
			logger.debug @curkeyword.keyword
		end
		
		
		if (params[:dir] == "-1") 
			if (params[:table_id].to_i > 1)
				@curkeyword =  SubjectKeyword.find(params[:table_id].to_i-1)
				@yt_items = YoutubeFeedEntry.by_keyword(@curkeyword.keyword)
			else
				@curkeyword =  SubjectKeyword.last
				@yt_items = YoutubeFeedEntry.by_keyword(@curkeyword.keyword)
			end
				
		end
		
		if (params[:dir] == "1") 
			if (params[:table_id].to_i < SubjectKeyword.count)
				@curkeyword =  SubjectKeyword.find(params[:table_id].to_i+1)
				@yt_items = YoutubeFeedEntry.by_keyword(@curkeyword.keyword)
			else
				@curkeyword =  SubjectKeyword.first
				@yt_items = YoutubeFeedEntry.by_keyword(@curkeyword.keyword)
			end
		end
		
		respond_to do |wants|
			wants.html
			wants.js
		end
	end
	
	
end
