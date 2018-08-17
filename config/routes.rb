Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy,:show ]
  resources :users

  get 'tops/index'

  resources :chats do
    collection do
      post :confirm
    end
  end
  get '/tops', to: 'tops#index'
end
