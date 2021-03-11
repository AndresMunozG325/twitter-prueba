Rails.application.routes.draw do
  resources :tweets do
    resources :likes
    post 'retweet', to: 'tweets/retweet'
  end
  devise_for :users
  resources :users do
    resources :friends
  end 
  get 'tweets/index'
  
  get 'home/index'
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
