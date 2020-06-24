Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users
  resources :transactions
  resources :groups

  get '/external', to: 'static_pages#external'
  get '/friends', to: 'static_pages#friends'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
