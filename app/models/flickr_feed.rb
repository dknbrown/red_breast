class FlickrFeed < ActiveRecord::Base

	    entries.each do |entry|
    unless exists? :player_url => entry.player_url
      create!(
        
      )
      end
    end
  end

end
