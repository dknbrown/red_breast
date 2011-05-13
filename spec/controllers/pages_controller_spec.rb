require 'spec_helper'

describe PagesController do
 render_views
  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    it "should have the right title" do
     get 'home'
     response.should have_selector("title",
                    :content => "Red Breast | Home")
    end

    it "should have a weather stub" do
		get :home
		response.should have_selector("weather")
    end
    
    
  end


end
