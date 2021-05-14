Rails.application.routes.draw do
 
  devise_for :users
  root "home#top"
  resources :users
  resources :events
  get 'my_calendar', to: 'events#my_calendar'
end
