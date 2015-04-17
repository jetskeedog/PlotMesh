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