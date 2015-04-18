Rails.application.routes.draw do

  devise_for :admins
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  resources :movies do
    resources :genres do
      member { post :vote }
    end
      resources :brands do
        member { post :vote }
    end
      resources :commons do
        member { post :vote }
    end
      resources :easter_eggs do
        member { post :vote }
    end
      resources :locations do
        member { post :vote }
    end
      resources :songs do
        member { post :vote }
    end
      resources :technicals do
        member { post :vote }
    end
      resources :themes do
        member { post :vote }
    end
      resources :goofs do
        member { post :vote }
    end
  end
 
  root "movies#index"
end
