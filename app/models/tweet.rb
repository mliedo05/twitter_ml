class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :content, presence: true

  scope :tweets_for_me , -> (user) {Tweet.where(user_id: user.friends.pluck(:friend_id)).or(where( user_id: user )) }
end
