require 'spec_helper'

describe RssFeedEntry do
  before(:each) do
    @attr = {
      :url => "url.com", 
      :title => "Duder",
      :description => "Some description content",
      :published_at => 2.days.ago
    }
  end

  it "should create a new instance given valid attributes" do
    RssFeedEntry.create!(@attr)
  end 

end
