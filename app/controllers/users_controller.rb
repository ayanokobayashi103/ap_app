class UsersController < ApplicationController
  before_action :authenticate_user!

  def review
    user_params
    if current_user.id != @user.id
      @user=User.find(params[:id])
    end
  end

  def show
    user_params
      @user = User.find(params[:id])
      @followers = @user.followers
      @following = @user.following
  end

  private
  def user_params
    @user = User.find(params[:id])
  end
end
