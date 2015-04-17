require 'spec_helper'
require 'factory_girl_rails'

  describe "A user signs in" do
    it "and votes on a genre" do
      create_genre 'Title', 'Genre'
      
      click_link 'up'

      expect(page).to have_content("Thanks for the vote")
    end
  end

  describe "A user signs in" do
    it "and votes on a genre" do
      sign_in_user 'username', 'password'
      
      visit '/movies/1'
      click_link 'up'

      expect(page).to have_content("Thanks for the vote")
    end
  end

  describe "A non-user votes on a genre" do
    it "and is prevented and presented with an alert" do
      visit '/movies/1'
      click_link 'up'

      expect(page).to have_content("You need to sign in or sign up before continuing.")
    end
  end