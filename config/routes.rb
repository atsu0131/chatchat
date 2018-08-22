Rails.application.routes.draw do
  root 'tops#index'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
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
