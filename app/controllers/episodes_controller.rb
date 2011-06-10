class EpisodesController < ApplicationController
	EPISODE = 1
	WEATHER_WO_ID = 864342
	def index
		@title = "Looking at stuff"
		@episode = EPISODE
		
		@weather_items = update_weather( WEATHER_WO_ID )
		
	end
	def update_weather (wocity)
		client = Weatherman::Client.new :unit => "f"
		client.lookup_by_woeid wocity
	end
end
