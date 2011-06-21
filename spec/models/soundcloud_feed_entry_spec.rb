require 'spec_helper'

describe SoundcloudFeedEntry do
  before(:each) do
    @attr = {
      :title => "title 1",
	  :sound_id => "123abc",
	  :subject_keyword_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    SoundcloudFeedEntry.create!(@attr)
  end  
  
  it "should respond to random" do 
	SoundcloudFeedEntry.should respond_to(:random)
  end
  
  it "should respond to the subject_keyword relationship" do 
	SoundcloudFeedEntry.create!(@attr)
	SoundcloudFeedEntry.first.should respond_to(:subject_keyword)
  end
end
