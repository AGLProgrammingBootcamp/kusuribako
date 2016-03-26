Rails.application.routes.draw do
  root 'home#top'
  resources :users
  resources :medicines
end
