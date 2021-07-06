module Api
    module V1
        class NewsController < ApplicationController
            include ActionController::HttpAuthentication::Basic::ControllerMethods
            http_basic_authenticate_with name: "api", password: "api"
            skip_before_action :authenticate_user!
            def new_twett
                tweets_array = []
                all_tweets = Tweet.all.order("created_at DESC")
                all_tweets.each do |t|
                    tweets_array.push({
                        id:t.id,
                        content:t.content,
                        user_id:t.user_id,
                        like_count:t.likes.count,
                        retweets_count:t.retweet,
                        rewtitted_from:t.retweet_ref,
                    })
                end
                @tweets = tweets_array
                render json: @tweets.last(50)
            end

            def tweets_date
                fecha1 = params[:fecha1]
                fecha2 = params[:fecha2]
                all_tweets = Tweet.order("created_at DESC")
                tweets_array = []
        
                all_tweets.each do |tweet|
                    if fecha1 <= tweet.created_at.strftime("%Y-%m-%d") && fecha2 >= tweet.created_at.strftime("%Y-%m-%d")
                        tweets_array.push({
                            id:tweet.id,
                            created_at: tweet.created_at,
                            content:tweet.content,
                            user_id:tweet.user_id,
                            like_count:tweet.likes.count,
                            retweets_count:tweet.retweet,
                            rewtitted_from:tweet.retweet_ref,})
                    end
                end
              render json: tweets_array
            end
        end
    end
end
