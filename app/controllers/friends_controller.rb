class FriendsController < ApplicationController
    before_action :set_user
    before_action :set_friend, only: [:destroy ]


    def follow
        @friend = Friend.create(user_id: current_user.id, friend_id: params[:id])
        redirect_to root_path
    end
      
    def destroy
        @friend.destroy 
        redirect_to root_path
    end
    private
    def set_user
        @user = User.find(current_user.id)
    end

    def set_friend
        @friend = Friend.find_by(user_id: current_user.id, friend_id: params[:id])
      end
end
