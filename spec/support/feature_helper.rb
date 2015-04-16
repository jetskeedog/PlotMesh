module FeatureHelper
  
  def sign_in_user(username, password)
     visit '/users/sign_in'
     user = create(:user)
     fill_in "Username", with: user.username
     fill_in "Password", with: user.password
     click_button "Log in"
  end
  
  def sign_in_admin(username, password)
    visit '/admins/sign_in'
    admin = create(:admin)
    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password
    click_button "Log in"
  end

  
    RSpec.configure do |config|
      config.include FeatureHelper
    end
end