# == Schema Information
# Schema version: 20110518191639
#
# Table name: flickr_feeds
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  url_square :string(255)
#  url_med    :string(255)
#  tag        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class FlickrFeed < ActiveRecord::Base



end
