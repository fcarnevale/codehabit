require 'spec_helper'

describe "Pages" do

  describe "Home page" do
    
    it "should have the content 'codehabit'" do
      visit '/pages/home'
      page.should have_content('codehabit')
    end
  end
end
