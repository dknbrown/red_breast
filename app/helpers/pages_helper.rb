module PagesHelper
	

	
	
	def randomsoundcloud
		@rsc = SoundcloudFeedEntry.random
	end

end
