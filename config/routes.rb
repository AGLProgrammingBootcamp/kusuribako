Rails.application.routes.draw do
  root 'home#top'
  resources :notifications
  resources :users
  resources :medicines
end
