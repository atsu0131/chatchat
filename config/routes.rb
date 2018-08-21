Rails.application.routes.draw do
  root 'tops#index'
  resources :sessions, only: [:new, :create, :destroy,:show ]
  resources :users
  resources :favorites, only: [:create,:destroy]

  resources :chats do
    collection do
      post :confirm
    end
  end
  get '/tops', to: 'tops#index'
end
