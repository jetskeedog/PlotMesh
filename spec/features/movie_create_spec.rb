require 'spec_helper'
require 'factory_girl_rails'

  describe "Create a movie" do
    it "with admin only" do
      visit '/admins/sign_in'
      admin = create(:admin)
      fill_in "Username", with: admin.username
      fill_in "Password", with: admin.password
        
      click_button "Log in"

      visit '/movies/new'
      
      fill_in "Title",    with: "Dolls"
      fill_in "Year",     with: "1987"
      fill_in "Rated",    with: "R"
      fill_in "Duration", with: "88 Min"
      fill_in "Synopsis", with: "Somethings happen"


      click_button "Add Movie"
      
      expect(page).to have_content("Movie was added!")  
    end
  end

  describe "A user creates a movie" do
    it "Only admins can do that" do
      visit '/users/sign_in'
      user = create(:user)
      fill_in "Username", with: user.username
      fill_in "Password", with: user.password
        
      click_button "Log in"
      
      visit '/movies/new'
 
      expect(page).to have_content("You need to sign in or sign up before continuing.")  #this alert needs to be changed to say admins only
    end
  end

  describe "A non-user or Admin" do
    it "can not create a movie" do
      visit '/movies/new'
    
      expect(page).to have_content("You need to sign in or sign up before continuing.")
    end
  end
    