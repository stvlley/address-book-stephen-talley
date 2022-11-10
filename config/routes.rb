Rails.application.routes.draw do

  # custom routes for view layer
  root "people#index"
  
  get "signup" => "users#new"
  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"
  
  # resources for control layer
  resources :users
  resources :sessions, except:[:index, :edit, :update, :show, :new, :destroy]
  resources :people do
    resources :numbers
    resources :emails
    resources :addresses 
  end
end
