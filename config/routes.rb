Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  root to: 'pages#home'
  get 'blog', to: 'pages#blog'
  resources :users, only: [:show, :index, :edit, :update] do
    resources :dogs, only: [:new, :create, :edit]
    resources :bookings, only: [:index]
  end

  resources :dogs, only: [:show, :index, :update, :destroy] do
    resource :bookings, only: [:show, :new, :create]
  end


  resources :bookings, only: [:destroy]
end
