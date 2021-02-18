class OwnersController < ApplicationController
  before_action :authenticate_owner!

  def show
    shop_params
  end

  private
  def shop_params
    @owner = Owner.find(params[:id])
  end

end
