class UsersController < ApplicationController
  def show
    @tweets = Tweet.where(user_id: params[:id]).order('id DESC')
    @tweets = @tweets.page(params[:page]).per(2)
    @user = User.find(params[:id])
  end
end
