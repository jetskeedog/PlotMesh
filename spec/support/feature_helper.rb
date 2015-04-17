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
  
  def create_genre(title, description)
    sign_in_user 'username', 'password'
    visit '/movies/2/genres/new'

    fill_in "Title", with: "Horror"
    fill_in "Description", with: "text"
    
    click_button "Create Genre"
  end
    
    
    

  
    RSpec.configure do |config|
      config.include FeatureHelper
    end
end