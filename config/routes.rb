Rails.application.routes.draw do

  root "home#top"
  devise_for :users
  
  resources :users
  delete 'destroy_user', to: 'users#destroy'
  
  resources :blogs
  resources :goals
end
