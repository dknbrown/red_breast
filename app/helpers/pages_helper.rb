module PagesHelper

	def randomflickr
		
		@rf = FlickrFeed.random
		
	end
	
	
	def randomsoundcloud
		@rsc = SoundcloudFeedEntry.random
	end

end
