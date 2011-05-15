# == Schema Information
# Schema version: 20110515022257
#
# Table name: subject_keywords
#
#  id         :integer         not null, primary key
#  keyword    :string(255)
#  ep         :integer
#  created_at :datetime
#  updated_at :datetime
#

class SubjectKeyword < ActiveRecord::Base
	attr_accessible :keyword, :ep

		
	def self.all_by_ep(ep_num)
		keys = self.find(:all, :select => 'keyword', :conditions => { :ep => ep_num })
		
	end


end
