Rails.application.routes.draw do

  devise_for :admins
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  resources :movies do
    resources :genres
  end
 
  root "movies#index"
end
