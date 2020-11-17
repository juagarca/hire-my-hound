Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show, :index] do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :dogs, only: :new
  end

  resources :dogs, only: [:show, :index]
end
