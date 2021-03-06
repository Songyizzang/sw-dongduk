Rails.application.routes.draw do
  root 'posts#index'
  get 'home/index'
  get 'register/info' # 로그인한 후 화면
  
  # 소셜 로그인 시 callbacks 지정
  devise_for :users, controllers: { omniauth_callbacks: 'user/omniauth_callbacks' }
  
  resources :posts
  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #실시간채팅 액션케이블
  mount ActionCable.server => '/cable'
  
  #신청서 작성
  post 'post/:post_id/apply' => 'apply#apply_toggle'
  
  #신청서 수락
  get 'post/:post_id/apply_accept/:apply_id' => 'apply#apply_accept'
  
  #알림
  get '/new_notifications/read_all' => 'new_notifications#read_all'
  #알림
  resources :new_notifications
end
