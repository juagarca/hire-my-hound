Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  
  resources :users, only: [:show, :index] do
    resources :dogs, only: [:new, :create, :edit, :update, :delete]
  end
  
  resources :dogs, only: [:show, :index]
end
