class TweetsController < ApplicationController
  before_action :move_to_index,except: [:index,:show]
  def index
    @Tweets = Tweet.order("id desc").page(params[:page]).per(5)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(create_params)
    redirect_to action: :index
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
  end

  def edit
    @tweet =Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(create_params) if tweet.user_id == current_user.id
    redirect_to action: :index
  end

 private
  def create_params
    params.require(:tweet).permit(:text,:title,:image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
