class HomeController < ApplicationController
    def index
        if user_signed_in?
            @tweets = Tweet.tweets_for_me(current_user).page(params[:page]) 
            
        else    
            @tweets = Tweet.page(params[:page]) 
            
        end
        @tweet = Tweet.new
        @users = User.page(params[:user_page]).per(3)
    end
end
