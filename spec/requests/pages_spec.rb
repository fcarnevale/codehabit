require 'spec_helper'

describe "Pages" do

  describe "Home page" do
    
    it "should have the content 'codehab.it'" do
      visit root_path
      page.should have_content('codehab.it')
    end

    it "should have the title 'codehab.it [home]'" do
      visit root_path
      page.should have_selector('title', text: 'codehab.it [home]')
    end
  end

  describe "About page" do
  	
  	it "should have the content 'about codehab.it'" do
  	  visit about_path
  	  page.should have_content('about codehab.it')	
  	end

  	it "should have the title 'codehab.it [about]'" do
  	  visit about_path
  	  page.should have_selector('title', text: 'codehab.it [about]')	
  	end
  end
end
