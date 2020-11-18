Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  resources :users, only: [:show, :index, :edit] do
    resources :dogs, only: [:new, :create, :edit, :update, :delete]
    resources :bookings, only: [ :index, :new, :create]
  end

  resources :dogs, only: [:show, :index]
  resources :bookings, only: [:show, :edit, :update, :destroy]
end
