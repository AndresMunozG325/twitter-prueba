Rails.application.routes.draw do
  get 'api/news'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :tweets do
    resources :likes
    post 'retweet', to: 'tweets/retweet'
  end
  devise_for :users
  resources :users do
    resources :friends
  end 
  get 'tweets/index'
  get '/api/news', to: 'api#news'
  get '/api/:date1/:date2', to: 'api#search_date'
  post '/api/create', to: 'api#create_tweet'
  
  get 'home/index'
  post '/search', to: 'search#results'
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
