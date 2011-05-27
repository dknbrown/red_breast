require 'spec_helper'

describe PagesController do
 render_views
 

  describe "GET 'home'" do
    it "should be successful" do
      get :home , :locale => 'en'
      #response.should be_success
    end
  end
    

end
