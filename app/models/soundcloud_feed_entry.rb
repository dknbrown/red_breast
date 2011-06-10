# == Schema Information
# Schema version: 20110610122209
#
# Table name: soundcloud_feed_entries
#
#  id                 :integer         not null, primary key
#  title              :string(255)
#  sound_id           :string(255)
#  subject_keyword_id :integer
#  created_at         :datetime
#  updated_at         :datetime
#

# == Schema Information
# Schema version: 20110524191807
#
# Table name: soundcloud_feed_entries
#
#  id                 :integer         not null, primary key
#  title              :string(255)
#  sound_id           :string(255)
#  subject_keyword_id :integer
#  created_at         :datetime
#  updated_at         :datetime
#
require 'soundcloud'
class SoundcloudFeedEntry < ActiveRecord::Base
attr_accessible :title, :sound_id, :subject_keyword_id
belongs_to :subject_keyword

	def self.update_entries(search_for_id)
		search_for = SubjectKeyword.find(search_for_id)
		sccodes = YAML::load_file('sccodes.yml').to_hash
		sc_consumer = Soundcloud.consumer("#{sccodes['key']}","#{sccodes['secret']}")
		access_token = OAuth::AccessToken.new(sc_consumer,"#{sccodes['key']}","#{sccodes['secret']}")
		sc_client = Soundcloud.register({:access_token => access_token})
		
		entries = sc_client.Track.find(:all,:params => {:tags => search_for.keyword, :order => 'hotness', :limit => 10})

		entries.each do |entry|
			unless exists? :sound_id => entry.id
			create!(
				:title => entry.title,
				:sound_id => entry.id,
				:subject_keyword_id => search_for_id
			)
			end
		end

    end
    
    def self.random()
		self.find(:first, :offset => rand(self.all.size-1))	
    end

end
