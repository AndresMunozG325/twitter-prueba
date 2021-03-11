class HomeController < ApplicationController
    def index
        @tweets = Tweet.page(params[:page]) 
        @tweet = Tweet.new
        @users = User.page(params[:user_page]).per(3)
    end
end
