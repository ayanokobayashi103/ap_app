class OwnersController < ApplicationController
  before_action :authenticate_owner!

  def show
    shop_params
    redirect_to root_path, notice: 'エラー' if current_owner.id != @owner.id
  end

  private

  def shop_params
    @owner = Owner.find(params[:id])
  end
end
