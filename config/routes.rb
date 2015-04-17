Rails.application.routes.draw do

  devise_for :admins
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  resources :movies do
    resources :genres do
      member { post :vote }
    end
  end
 
  root "movies#index"
end
