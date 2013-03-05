require 'spec_helper'

describe "Pages" do

  describe "Home page" do
    
    it "should have the content 'codehabit'" do
      visit root_path
      page.should have_content('codehabit')
    end

    it "should have the title 'codehabit [home]'" do
      visit root_path
      page.should have_selector('title', text: 'codehabit [home]')
    end
  end

  describe "About page" do
  	
  	it "should have the content 'about codehabit'" do
  	  visit about_path
  	  page.should have_content('about codehabit')	
  	end

  	it "should have the title 'codehabit [about]'" do
  	  visit about_path
  	  page.should have_selector('title', text: 'codehabit [about]')	
  	end
  end
end
