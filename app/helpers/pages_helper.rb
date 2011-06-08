module PagesHelper
	
	def randomflickr
		
		@rf = FlickrFeed.imageGridArray(@episode)
		
	end
	
	
	def randomsoundcloud
		@rsc = SoundcloudFeedEntry.random
	end

end
