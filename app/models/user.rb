class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets
  has_many :likes, dependent: :destroy
  has_many :friends

  has_many :added_friends, :class_name => 'Friend', :foreign_key => 'user_id'

  before_create :set_api_key


  def find_friendship(user)
    if self.friends.where(friend_id:user.id).count > 0
      return true
    else
      return false
    end
  end

  def generate_api_key
    SecureRandom.base58(24)
  end

  def set_api_key
    self.api_key = generate_api_key
  end

end
