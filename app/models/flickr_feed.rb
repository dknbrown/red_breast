# == Schema Information
# Schema version: 20110524191807
#
# Table name: flickr_feeds
#
#  id                 :integer         not null, primary key
#  title              :string(255)
#  url_square         :string(255)
#  url_med            :string(255)
#  keyword            :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  subject_keyword_id :integer
#  photo_id           :string(255)
#  page_url           :string(255)
#

class FlickrFeed < ActiveRecord::Base
attr_accessible :title, :keyword, :url_square, :url_med, :subject_keyword_id, :photo_id, :page_url
belongs_to :subject_keyword

	def self.update_entries(search_for_id)
		search_for = SubjectKeyword.find(search_for_id)
		flickrcodes = YAML::load_file('flickrcodes.yml').to_hash
		FlickRaw.api_key="#{flickrcodes['key']}"
		FlickRaw.shared_secret="#{flickrcodes['secret']}"
		list   = flickr.photos.search( :tags => search_for.keyword , :sort => "interestingness-desc", :per_page => 10 )
		
		list.each do |photo| 
			unless exists? :photo_id => photo.id
			info = flickr.photos.getInfo :photo_id => photo.id 
			sizes = flickr.photos.getSizes :photo_id => photo.id 
			square = sizes.find {|s| s.label == 'Square' }
			
				unless square.width != 75
				create!(
				:title => photo.title,
				:keyword => photo.secret,
				:url_square => FlickRaw.url_s(photo),
				:url_med => FlickRaw.url_z(photo),
				:photo_id => photo.id,
				:page_url => FlickRaw.url_photopage(info),
				:subject_keyword_id => search_for_id
				)
				end
			end
		end
	end
	
	def self.imageGridArray(ep)
		hshThumbs = Hash.new()
		uniqueIds = []
		randomImage = FlickrFeed.new()
		keyWords = SubjectKeyword.where("episode_id = ?" ,  ep)
		(1..12).each do |count|
			
			if uniqueIds.empty?
					randomImage = self.randomByKeyword(keyWords.find(:first, :offset => rand(keyWords.all.size-1)).id)
			else
			
			until !uniqueIds.include? randomImage.id
				randomImage = self.randomByKeyword(keyWords.find(:first, :offset => rand(keyWords.all.size-1)).id)
			end
			
			end
			uniqueIds << randomImage.id
			hshThumbs[count] = { "url_square" => randomImage.url_square,
							  "url_med" => randomImage.url_med,
							  "page_url" => randomImage.page_url,
							  "keyword" => randomImage.subject_keyword.keyword }
		end
		return hshThumbs
	end
	
	
	def self.randomByKeyword(kw)
		itemQ = self.where("subject_keyword_id = ?" ,  kw)
		itemQ.find(:first, :offset => rand(itemQ.all.size-1))
	end
	

	
end
