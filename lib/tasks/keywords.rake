
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

	SubjectKeyword.all_by_ep(1) do |sk|
		YoutubeFeedEntry.update_entries( sk.id )
	end
	
end
