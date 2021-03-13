class SearchController < ApplicationController

    def results
        @tweets = Tweet.search_tweet(params[:term])
    end

end
