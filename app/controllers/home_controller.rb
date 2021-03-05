class HomeController < ApplicationController
    def index
        @tweets = Tweet.page(params[:page]) 
        @tweet = Tweet.new
    end
end
