class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets
  has_many :likes, dependent: :destroy
  has_many :friends

  def find_friendship(user)
    if self.friends.where(friend_id:user.id).count > 0
      return true
    else
      return false
    end
  end
end
