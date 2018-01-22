Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create]
  resources :sessions, only: [:new, :create]
end
