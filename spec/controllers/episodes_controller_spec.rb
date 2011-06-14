require 'spec_helper'

describe EpisodesController do
	render_views
	
  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end
    it "should have the right title" do
     get :index
     response.should have_selector("title",
                    :content => "Red Breast")
    end

    
    it "should have a slogan" do
		get :index
		response.should have_selector("slogan")
    end
    
  end
  
  describe "GET 'show'" do
	it "should have a weather stub" do
		get :show , :id => 1
		response.should have_selector("weather")
    end
  end

end
