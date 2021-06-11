class HomeController < ApplicationController
  def index
    @tweets = Tweet.order("created_at DESC")
    @tweets = Kaminari.paginate_array(@tweets).page(params[:page]).per(2)
    @users = User.all
    @tweet = Tweet.new
    @like = Like.new
  end
end
