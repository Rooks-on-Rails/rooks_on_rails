Rails.application.routes.draw do
  resources :games
  resources :pieces

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing_page#index'
end
