class TweetsController < ApplicationController
  before_action :move_to_index,except: [:index,:show]
  def index
    @Tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(create_params)
    redirect_to action: :index
  end

  def show
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  def edit
    @tweet =Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(create_params)
    redirect_to action: :index
  end

 private
  def create_params
    params.require(:tweet).permit(:text,:title)
  end

  def move_to_index
    redirect_to action: :index
  end

end
