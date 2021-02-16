class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    user_params
    if current_user.id != @user.id
      redirect_to shops_path, notice: "エラー" 
    end
  end

  private
  def user_params
    @user = User.find(params[:id])
  end
end
