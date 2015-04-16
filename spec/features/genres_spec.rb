require 'spec_helper'
require 'factory_girl_rails'

  describe "Genres can not be created" do
    it "A user must be signed in" do
      visit "/movies/2"
      click_link 'Add Genre'

      expect(page).to have_content("You need to sign in or sign up before continuing")
    end
  end

  describe "Genres creation is successful" do
    it "only after a user is signed in" do
      sign_in_user 'username', 'password'
      visit "/movies/2"
      click_link 'Add Genre'

      fill_in "Title", with: "Comedy"
      fill_in "Description", with: "Text"

      click_button "Create Genre"
      expect(page).to have_content("Genre was added!")
    end
  end
