require 'spec_helper'

describe SubjectKeyword do
  before(:each) do
    @attr = {
		:keyword => "test",
		:episode_id => 1
    }
    end
    
    it "should create a new instance given valid attributes" do
		SubjectKeyword.create!(@attr)
	end  
    
    it "should respond find all records by ep" do
		SubjectKeyword.should respond_to(:all_by_ep)
    end 
    
    it "should respond to the youtube_feed_entry relationship" do 
	SubjectKeyword.first.should respond_to(:youtube_feed_entries)
    end
    
    it "should respond to the flickr_feed relationship" do 
	SubjectKeyword.first.should respond_to(:flickr_feeds)
    end
    
    it "should respond to the soundcloud_feed_entry relationship" do 
	SubjectKeyword.first.should respond_to(:soundcloud_feed_entries)
    end
    
    it "should respond to the soundcloud_feed_entry relationship" do 
	SubjectKeyword.first.should respond_to(:episode)
    end
end
