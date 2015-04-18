require 'spec_helper'
require 'factory_girl_rails'

  describe "Brands can not be created" do
    it "A user must be signed in" do
      visit "/movies/2"
      click_link 'Add Brand'

      expect(page).to have_content("You need to sign in or sign up before continuing")
    end
  end

  describe "Brands creation is successful" do
    it "only after a user is signed in" do
      sign_in_user 'username', 'password'
      visit "/movies/2"
      click_link 'Add Brand'

      fill_in "Title", with: "Pepsi"
      fill_in "Description", with: "Text"

      click_button "Create Brand"
      expect(page).to have_content("The Pepsi brand was added to The Others")
    end
  end

  describe "Cliches can not be created" do
    it "A user must be signed in" do
      visit "/movies/5"
      click_link 'Add Cliche'

      expect(page).to have_content("You need to sign in or sign up before continuing")
    end
  end

  describe "Cliches creation is successful" do
    it "only after a user is signed in" do
      sign_in_user 'username', 'password'
      visit "/movies/5"
      click_link 'Add Cliche'

      fill_in "Title", with: "Car explodes with bullet"
      fill_in "Description", with: "Text"

      click_button "Create Common"
      expect(page).to have_content("The Car explodes with bullet common was added to Guardians of the Galaxy!")
    end
  end

  describe "Easter Eggs can not be created" do
    it "A user must be signed in" do
      visit "/movies/5"
      click_link 'Add Easter Egg'

      expect(page).to have_content("You need to sign in or sign up before continuing")
    end
  end

describe "Easter Egg creation is successful" do
    it "only after a user is signed in" do
      sign_in_user 'username', 'password'
      visit "/movies/5"
      click_link 'Add Easter Egg'

      fill_in "Title", with: "79"
      fill_in "Description", with: "Text"

      click_button "Create Easter egg"
      expect(page).to have_content("The 79 easter egg was added to Guardians of the Galaxy!")
    end
  end

  describe "Goofs can not be created" do
    it "A user must be signed in" do
      visit "/movies/5"
      click_link 'Add Goof'

      expect(page).to have_content("You need to sign in or sign up before continuing")
    end
  end

describe "Goof creation is successful" do
    it "only after a user is signed in" do
      sign_in_user 'username', 'password'
      visit "/movies/2"
      click_link 'Add Goof'

      fill_in "Title", with: "Camera Boom"
      fill_in "Description", with: "Text"

      click_button "Create Goof"
      expect(page).to have_content("The Camera Boom goof was added to The Others")
    end
  end

  describe "Locations can not be created" do
    it "A user must be signed in" do
      visit "/movies/5"
      click_link 'Add Location'

      expect(page).to have_content("You need to sign in or sign up before continuing")
    end
  end

describe "Location creation is successful" do
    it "only after a user is signed in" do
      sign_in_user 'username', 'password'
      visit "/movies/2"
      click_link 'Add Location'

      fill_in "Title", with: "Hollywood"
      fill_in "Description", with: "Text"

      click_button "Create Location"
      expect(page).to have_content("Hollywood was added to The Others as a location!")
    end
  end

  describe "Songs can not be created" do
    it "A user must be signed in" do
      visit "/movies/5"
      click_link 'Add Song'

      expect(page).to have_content("You need to sign in or sign up before continuing")
    end
  end

describe "Song creation is successful" do
    it "only after a user is signed in" do
      sign_in_user 'username', 'password'
      visit "/movies/2"
      click_link 'Add Song'

      fill_in "Title", with: "Love Is"
      fill_in "Description", with: "Text"

      click_button "Create Song"
      expect(page).to have_content("The Love Is song was added to The Others")
    end
  end


describe "Technicals can not be created" do
    it "A user must be signed in" do
      visit "/movies/5"
      click_link 'Add Technical'

      expect(page).to have_content("You need to sign in or sign up before continuing")
    end
  end

describe "Technical creation is successful" do
    it "only after a user is signed in" do
      sign_in_user 'username', 'password'
      visit "/movies/2"
      click_link 'Add Technical'

      fill_in "Title", with: "Dolby"
      fill_in "Description", with: "Text"

      click_button "Create Technical"
      expect(page).to have_content("Dolby was added to The Others")
    end
  end

  describe "Themes can not be created" do
    it "A user must be signed in" do
      visit "/movies/5"
      click_link 'Add Theme'

      expect(page).to have_content("You need to sign in or sign up before continuing")
    end
  end

describe "Theme creation is successful" do
    it "only after a user is signed in" do
      sign_in_user 'username', 'password'
      visit "/movies/2"
      click_link 'Add Theme'

      fill_in "Title", with: "The Sun"
      fill_in "Description", with: "Text"

      click_button "Create Theme"
      expect(page).to have_content("The Sun theme was added to The Others")
    end
  end

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
      expect(page).to have_content("The Comedy genre was added to The Others")
    end
  end