ActiveAdmin.register User do
  
  filter :nickname
  filter :email
  
  index do
    column :nickname
    column :email 
    column :created_at
    column :user_photo 
    column :tweets do |user|
      user.tweets.count
    end
    column :likes do |user|
      user.likes.count
    end
    column :friends do |user|
      user.friends.count
    end
    column :retweets do |user|
      user.tweets.where.not(retweet_ref: id).count
    end
    actions
  end
end
