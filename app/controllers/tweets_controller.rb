class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :show, :destroy]

  def index
    @tweets = Tweet.order('id DESC')
    @tweets = @tweets.page(params[:page]).per(10)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    redirect_to root_path
  end

  def edit
  end

  def destroy
    @tweet.destroy
    redirect_to root_path
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.order('id DESC').includes(:user)
    @comments = @comments.page(params[:page]).per(10)
  end


  private

  def tweet_params
    params.require(:tweet).permit(:text, :image).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
