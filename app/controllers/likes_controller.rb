class LikesController < ApplicationController
    before_action :find_tweet
    before_action :find_like, only: [:destroy]

    def create
        if already_liked?
            flash[:notice] = "Tweet already liked"
        else
            @tweet.likes.create(user_id: current_user.id)
        end
        redirect_to root_path
    end
    
    def destroy
        if already_liked?
            @like.destroy
        else
            flash[:notice] = "Tweet already unliked"
        end
        redirect_to root_path
    end
    
    private

    def find_tweet
        @tweet = Tweet.find(params[:tweet_id])
    end
    
    def find_like
        @like = @tweet.likes.find(params[:id])
    end

    def already_liked?
        Like.find_by(user_id: current_user.id, tweet_id: params[:tweet_id]) != nil
    end
end