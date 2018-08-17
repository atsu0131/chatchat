Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy,:show ]
  resources :users


  root 'tops#index'

  resources :chats do
    collection do
      post :confirm
    end
  end

end
