Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  resources :users, only: [:show, :index, :edit, :update] do
    resources :dogs, only: [:new, :create, :edit, :update, :delete]
  end

  resources :dogs, only: [:show, :index] do
    resource :bookings, only: [:show, :new, :create]
  end


  resources :bookings, only: [:destroy]
end
