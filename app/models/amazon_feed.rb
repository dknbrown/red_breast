# == Schema Information
# Schema version: 20110610122209
#
# Table name: amazon_feeds
#
#  id                 :integer         not null, primary key
#  subject_keyword_id :integer
#  title              :string(255)
#  image_url          :string(255)
#  page_url           :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  price              :decimal(8, 2)
#

class AmazonFeed < ActiveRecord::Base
end
