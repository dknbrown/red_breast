module ApplicationHelper

	def randomflickr
		@rf = FlickrFeed.random
	end
end
