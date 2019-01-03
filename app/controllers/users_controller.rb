class UsersController < ApplicationController
  def show
    @tweets = Tweet.where(user_id: params[:id]).page(params[:page]).per(10).order('id DESC')
    @user = User.find(params[:id])
  end

  def index
    @users = User.where('name LIKE(?)', "%#{params[:keyword]}%").limit(10)
    respond_to do |format|
      format.json
    end
  end
end
