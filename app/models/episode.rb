# == Schema Information
# Schema version: 20110610122209
#
# Table name: episodes
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  slogan     :string(255)
#  location   :string(255)
#  css        :string(255)
#  bg_img     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Episode < ActiveRecord::Base
	attr_accessible :title, :slogan, :location, :css, :bg_img
	has_many :subject_keywords
	
	
end
