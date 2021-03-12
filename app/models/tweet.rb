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
end
