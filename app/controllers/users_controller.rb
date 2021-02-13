class UsersController < ApplicationController
  def show
    user_params
  end

  private
  def user_params
    @user = User.find(params[:id])
  end
end
