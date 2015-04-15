require 'spec_helper'
require 'factory_girl_rails'

  describe "signs up" do
    it "successful login" do
      visit '/users/sign_up'
      expect(page).to have_content("Sign up")
      
      fill_in "Username", with: "jetskeedog"
      fill_in "Name",     with: "Jesse"
      fill_in "Location", with: "Las Vegas"
      fill_in "Email",    with: "test@test.com"
      fill_in "Password", with: "nooneknows"
      fill_in "Password confirmation", with: "nooneknows"
      save_and_open_page
      click_button "Sign up"
      
      expect(page).to have_content("Users#show")  
    end
  end

    describe "A user" do
      it "logs in successfully" do
        visit '/users/sign_in'
        user = create(:user)
        fill_in "Username", with: user.username
        fill_in "Password", with: user.password
        
        click_button "Log in"
        
        expect(page).to have_content("Signed in successfully.")
      end
end

describe "Incorrect password" do
  it "error message is displayed for incorrect password" do
        visit '/users/sign_in'
        user = build(:user)
        fill_in "Username", with: user.username
        fill_in "Password", with: ""
        
        click_button "Log in"
        
        expect(page).to have_content("Invalid username or password.")
      end
end