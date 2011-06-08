require 'spec_helper'

describe FlickrFeed do
  before(:each) do
    @attr = {
				:title => "p title",
				:keyword => "12345",
				:url_square => "blabla.jpg",
				:url_med => "blabla.jpg",
				:photo_id => "123abc",
				:page_url => "blabla.jpg",
				:subject_keyword_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    FlickrFeed.create!(@attr)
  end  
  
  it "should respond to randomByKeyword" do 
	FlickrFeed.should respond_to(:randomByKeyword)
  end
  
  it "should respond to imageGridArray" do 
	FlickrFeed.should respond_to(:imageGridArray)
  end
  
  it "should respond to the subject_keyword relationship" do 
	FlickrFeed.first.should respond_to(:subject_keyword)
  end
end
