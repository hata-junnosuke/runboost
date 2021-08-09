# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#top'
  devise_for :users
  resources :users
  resources :blogs
  resources :goals
  get 'home/about'
end
