require 'spec_helper'

describe Episode do

	before(:each) do
    @attr = {
		:title => "test",
		:slogan => "test",
		:location => "12345",
		:css => "test.css",
		:bg_img => "test.jpg"
    }
    end
    
    it "should create a new instance given valid attributes" do
		Episode.create!(@attr)
	end 
	
	it "should respond to the soundcloud_feed_entry relationship" do 
	Episode.first.should respond_to(:subject_keywords)
    end
end
