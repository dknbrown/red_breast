
namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
	make_keywords
	make_yt_chache
  end
end



def make_keywords


SubjectKeyword.create!(:keyword => "Viking" , :ep => 1)
SubjectKeyword.create!(:keyword => "Vikings" , :ep => 1)
SubjectKeyword.create!(:keyword => "Carl" , :ep => 1)
SubjectKeyword.create!(:keyword => "Sagan" , :ep => 1)
SubjectKeyword.create!(:keyword => "Carl Sagan" , :ep => 1)
SubjectKeyword.create!(:keyword => "Berserk" , :ep => 1)
SubjectKeyword.create!(:keyword => "Cosmos" , :ep => 1)
SubjectKeyword.create!(:keyword => "Plunder" , :ep => 1)
SubjectKeyword.create!(:keyword => "Pillage" , :ep => 1)
SubjectKeyword.create!(:keyword => "Norse" , :ep => 1)
SubjectKeyword.create!(:keyword => "Billions and billions" , :ep => 1)
SubjectKeyword.create!(:keyword => "Pale blue dot" , :ep => 1)
SubjectKeyword.create!(:keyword => "Leif Erickson" , :ep => 1)

end

def make_yt_chache

	

YoutubeFeedEntry.update_entries( "Viking")
YoutubeFeedEntry.update_entries("Vikings")
YoutubeFeedEntry.update_entries("Carl")
YoutubeFeedEntry.update_entries("Sagan")
YoutubeFeedEntry.update_entries("Carl Sagan")
YoutubeFeedEntry.update_entries("Berserk")
YoutubeFeedEntry.update_entries("Cosmos")
YoutubeFeedEntry.update_entries("Plunder")
YoutubeFeedEntry.update_entries("Pillage")
YoutubeFeedEntry.update_entries("Norse")
YoutubeFeedEntry.update_entries("Billions and billions")
YoutubeFeedEntry.update_entries("Pale blue dot")
YoutubeFeedEntry.update_entries("Leif Erickson")	

end
