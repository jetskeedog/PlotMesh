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
      attach_file "Profilepic", 'spec/images/frankenstien.jpg'
      save_and_open_page
      click_button "Sign up"

      expect(page).to have_content("Welcome! You have signed up successfully.")  
    end
  end

  describe "A user" do
    it "logs in successfully" do
      sign_in_user 'username', 'password'

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

  describe "An admin" do
    it "logs in successfully" do
      sign_in_admin 'username', 'password'

      expect(page).to have_content("Signed in successfully.")
    end
  end

