Rails.application.routes.draw do
  get 'tops/index'

  resources :chats do
    collection do
      post :confirm
    end
  end
  get '/tops', to: 'tops#index'
end
