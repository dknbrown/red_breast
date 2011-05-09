# == Schema Information
# Schema version: 20110509162526
#
# Table name: twitter_feed_entries
#
#  id                :integer         not null, primary key
#  profile_image_url :string(255)
#  from_user         :string(255)
#  description       :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class TwitterFeedEntry < ActiveRecord::Base
  attr_accessible :profile_image_url, :from_user, :description

  def self.update_entries(search_for)
    search = Twitter::Search.new
    entries = search.containing(search_for)

    entries.each do |entry|
    unless exists? :description => entry.text
      create!(
        :profile_image_url => entry.profile_image_url,
        :from_user => entry.from_user,
        :description => entry.text
      )
      end
    end

  end
end
