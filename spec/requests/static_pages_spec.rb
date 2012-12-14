require 'spec_helper'

describe "Static pages" do
  
  describe "Home page" do
    it "should have name of app" do
      visit home_path
      page.should have_selector('h1',text: 'Notable')
    end
    it "should have the base title" do
		  visit home_path
		  page.should have_selector('title', 
        text: "Railstut Sample App")
		end
    it "should not have a custom page title" do
      visit home_path
      page.should_not have_selector('title', text: " | Home")      
    end
  end

 describe "Help page" do
    it "should have the content 'Help'" do
      visit help_path
      page.should have_selector('h1', text: 'Help')
    end
    it "should have the right title" do
		  visit help_path
		  page.should have_selector('title', text: " | Help")
		end    
  end

  describe "About page" do
    it "should have the content 'About'" do
      visit about_path
      page.should have_selector('h1', text: 'About')
    end
    it "should have the right title" do
		  visit about_path
		  page.should have_selector('title', text: " | About")
		end    
  end

  describe "Contact page" do
    it "should have the content 'Contact'" do
      visit contact_path
      page.should have_selector('h1', text: 'Contact')
    end
    it "should have the right title" do
		  visit contact_path
		  page.should have_selector('title', text: " | Contact")
		end    
  end

end