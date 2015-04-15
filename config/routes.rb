Rails.application.routes.draw do

  devise_for :admins
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
 
  root "users#show"
end
