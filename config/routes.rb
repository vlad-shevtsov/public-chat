Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: "home#index"
  get 'signout', to: 'sessions#destroy', as: 'signout'
    resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  resources :chats
  resources :messages


  root to: "home#index"
end
