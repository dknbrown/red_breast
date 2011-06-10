# == Schema Information
# Schema version: 20110610124650
#
# Table name: subject_keywords
#
#  id         :integer         not null, primary key
#  keyword    :string(255)
#  episode_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class SubjectKeyword < ActiveRecord::Base
	attr_accessible :keyword, :ep
	belongs_to :episode
	has_many :youtube_feed_entries
	has_many :flickr_feeds
	has_many :soundcloud_feed_entries
		
	def self.all_by_ep(ep_num)
		keys = self.find(:all, :conditions => { :episode_id => ep_num })
		
	end


end
