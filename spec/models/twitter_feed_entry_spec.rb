require 'spec_helper'

describe TwitterFeedEntry do
  before(:each) do
    @attr = {
      :profile_image_url => "url.com", 
      :from_user => "Duder",
      :description => "Some description content",
    }
  end

  it "should create a new instance given valid attributes" do
    TwitterFeedEntry.create!(@attr)
  end 
end
