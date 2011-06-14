module EpisodesHelper

	def randomflickr
		
		@rf = FlickrFeed.imageGridArray(@episode)
		
	end
	
end
