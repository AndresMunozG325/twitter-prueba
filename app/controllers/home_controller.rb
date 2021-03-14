class HomeController < ApplicationController
    def index
        if user_signed_in?
            @tweets = Tweet.tweets_for_me(current_user).page(params[:page]).order("created_at DESC") 
            if params[:hashtag].present?
                @tweets = Tweet.search_my_tweets("##{params[:hashtag]}").page(params[:page]).order("created_at DESC")
            end
        else    
            @tweets = Tweet.page(params[:page]).order("created_at DESC") 
            if params[:hashtag].present?
                @tweets = Tweet.search_my_tweets("##{params[:hashtag]}").page(params[:page]).order("created_at DESC")
            end
            
        end
        @tweet = Tweet.new
        @users = User.page(params[:user_page]).per(3)
    end
end
