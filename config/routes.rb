Rails.application.routes.draw do
  get 'static/top'

  resources :histories
  root 'static#top'
  resources :users
  resources :medicines
end
