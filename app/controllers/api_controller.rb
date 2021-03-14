class ApiController < ActionController::API
  def news
    @tweets = Tweet.all.order(created_at: :desc).limit(50)
    tweet_array = []
    @tweets.each do |tweet|
      tweet_hash = {
        id: tweet.id,
        content: tweet.contents,
        user_id: tweet.user_id,
        like_count: tweet.likes.count
      }
      tweet_array.push tweet_hash
    end
    render json: tweet_array
  end
end
