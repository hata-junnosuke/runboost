Rails.application.routes.draw do
  root "home#top"
  devise_for :users
  
  resources :users
  resources :events
  get 'my_calendar', to: 'events#my_calendar'
  resources :blogs
end
