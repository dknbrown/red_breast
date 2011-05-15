class ItemsController < ApplicationController

	def index
	logger.debug "items index waka waka"
	
	@yt_items = YoutubeFeedEntry.random
	
		respond_to do |wants|
			wants.html
			wants.js
		end
	end
	
	
end
