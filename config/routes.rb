Rails.application.routes.draw do
  resources :histories
  root 'home#top'
  resources :users
  resources :medicines
end
