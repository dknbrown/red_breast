require 'spec_helper'

describe YoutubeFeedEntry do
    before(:each) do
    @attr = {
      :player_url => "url.com",
      :thumbnail_url => "url.com", 
      :updated_at => 2.days.ago,
      :published_at => 2.days.ago,
      :author => "Duder",
      :description => "Some description content",
      :title => "Some title content"
    }
  end

  it "should create a new instance given valid attributes" do
    YoutubeFeedEntry.create!(@attr)
  end  
  
  it "should respond to random" do 
	YoutubeFeedEntry.should respond_to(:random)
  end
end