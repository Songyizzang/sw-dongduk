Rails.application.routes.draw do
  root 'home#index'


  devise_for :users
  resources :posts
  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
end
