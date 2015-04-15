require 'spec_helper'
require 'factory_girl_rails'

describe "A user" do
  it "logs in successfully" do
    visit '/admins/sign_in'
    admin = create(:admin)
    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password
        
    click_button "Log in"
        
    expect(page).to have_content("Signed in successfully.")
  end
end

describe "Incorrect password" do
  it "error message is displayed for incorrect password" do
    visit '/admins/sign_in'
    admin = build(:admin)
    fill_in "Username", with: admin.username
    fill_in "Password", with: ""
        
    click_button "Log in"
        
    expect(page).to have_content("Invalid username or password.")
  end
end