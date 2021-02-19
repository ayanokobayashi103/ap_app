class OwnersController < ApplicationController
  before_action :authenticate_owner!

  def show
    shop_params
    if current_owner.id != @owner.id
      redirect_to root_path, notice: "エラー"
    end
  end

  private
  def shop_params
    @owner = Owner.find(params[:id])
  end

end
