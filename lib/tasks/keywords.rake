
namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_episodes
	make_keywords
	make_yt_chache
	make_flickr_chache
	make_soundcloud_chache
  end
end

def make_episodes

Episode.create!( :title => "Project Red Breast", :slogan => "From Dry Shrubby Fields to Wet Bottom-land Forests", :location => "864342", :css => "project_redbreast.css", :bg_img=> "rich-bg-2.jpg")
Episode.create!( :title => "Koala Lamprey", :slogan => "From Down Under to Wet Bottom-feed Forests", :location => "1154781", :css => "koala_lamprey.css")

end

def make_keywords


SubjectKeyword.create!(:keyword => "Viking" , :episode_id => 1)
SubjectKeyword.create!(:keyword => "Vikings" , :episode_id => 1)
SubjectKeyword.create!(:keyword => "Carl" , :episode_id => 1)
SubjectKeyword.create!(:keyword => "Sagan" , :episode_id => 1)
SubjectKeyword.create!(:keyword => "Carl Sagan" , :episode_id => 1)
SubjectKeyword.create!(:keyword => "Berserk" , :episode_id => 1)
SubjectKeyword.create!(:keyword => "Cosmos" , :episode_id => 1)
SubjectKeyword.create!(:keyword => "Plunder" , :episode_id => 1)
SubjectKeyword.create!(:keyword => "Pillage" , :episode_id => 1)
SubjectKeyword.create!(:keyword => "Norse" , :episode_id => 1)
SubjectKeyword.create!(:keyword => "Billions and billions" , :episode_id => 1)
SubjectKeyword.create!(:keyword => "Pale blue dot" , :episode_id => 1)
SubjectKeyword.create!(:keyword => "Leif Erickson" , :episode_id => 1)

SubjectKeyword.create!(:keyword => "Outback" , :episode_id => 2)
SubjectKeyword.create!(:keyword => "Mad Max" , :episode_id => 2)
SubjectKeyword.create!(:keyword => "kangaroo" , :episode_id => 2)
SubjectKeyword.create!(:keyword => "steve irwin" , :episode_id => 2)
SubjectKeyword.create!(:keyword => "Tazmania" , :episode_id => 2)
SubjectKeyword.create!(:keyword => "Ozploitation" , :episode_id => 2)
SubjectKeyword.create!(:keyword => "Kowala" , :episode_id => 2)
SubjectKeyword.create!(:keyword => "Lamprey" , :episode_id => 2)
SubjectKeyword.create!(:keyword => "eel" , :episode_id => 2)
SubjectKeyword.create!(:keyword => "jawless" , :episode_id => 2)
SubjectKeyword.create!(:keyword => "Chordata" , :episode_id => 2)


end

def make_yt_chache
	p "starting youtube"
	SubjectKeyword.all.each do |sk|
		YoutubeFeedEntry.update_entries( sk.id )
	end
	
end

def make_flickr_chache
	p "starting flickr"
	SubjectKeyword.all.each do |sk|
		FlickrFeed.update_entries( sk.id )
	end
	
end

def make_soundcloud_chache
	p "starting soundcloud"
	SubjectKeyword.all.each do |sk|
		SoundcloudFeedEntry.update_entries( sk.id )
	end
	
end
