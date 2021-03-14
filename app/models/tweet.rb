class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  #scope :tweets_for_me, ->{where(user_id: current_user.id) }
  def self.tweets_for_me(user)
    @my_friends = Friend.where(user_id:user.id)
    id_friends = []
    @my_friends.each do |my_f|
      id_friends.push(my_f.friend_id)
    end
    Tweet.where(user_id: id_friends)
  end

  def self.search_tweet(term)
    Tweet.where("contents LIKE ?", "%#{term}%")
  end
  
  def self.search_my_tweets(x)
    @my_tweets = Tweet.all
    my_tweet_id_array = []
    @my_tweets.each do |my_tweet|
        if my_tweet.contents.include? "#{x}"
            my_tweet_id_array << my_tweet.id
        end
    end
    self.where(id: my_tweet_id_array)
end

  
end
