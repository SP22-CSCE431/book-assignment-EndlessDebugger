Rails.application.routes.draw do
  resources :lists
  resources :users
  resources :books
  root 'lists#index'
end
