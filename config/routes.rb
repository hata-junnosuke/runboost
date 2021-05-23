Rails.application.routes.draw do
  get "home/top" => "home#top"
  devise_for :users
  
  resources :users
  resources :events
  get 'my_calendar', to: 'events#my_calendar'
  resources :blogs
end
