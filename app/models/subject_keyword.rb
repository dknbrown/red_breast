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
	attr_accessible :keyword, :episode_id
	belongs_to :episode
	has_many :youtube_feed_entries
	has_many :flickr_feeds
	has_many :soundcloud_feed_entries
		
	def self.all_by_ep(ep_num)
		Episode.find(ep_num).subject_keywords
		
	end
	
	def self.rand_by_ep(ep_num)
		epKeywords = all_by_ep(ep_num)
		randomKeyword = epKeywords.find(:first, :offset => rand(epKeywords.size-1))
	end


end
