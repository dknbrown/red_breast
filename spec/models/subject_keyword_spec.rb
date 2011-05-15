require 'spec_helper'

describe SubjectKeyword do
  before(:each) do
    @attr = {
		:keyword => "test",
		:ep => 1
    }
    end
    
    it "should create a new instance given valid attributes" do
		SubjectKeyword.create!(@attr)
	end  
    
    it "should respond find all records by ep" do
		SubjectKeyword.should respond_to(:all_by_ep)
    end 
end
