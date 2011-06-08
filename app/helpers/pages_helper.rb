module PagesHelper
	EPISODE = 1

	def randomflickr
		
		@rf = FlickrFeed.imageGridArray(EPISODE)
		
	end
	
	
	def randomsoundcloud
		@rsc = SoundcloudFeedEntry.random
	end

end
