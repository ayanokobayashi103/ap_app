class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update]
  before_action :owner?, only: [:new, :ceate, :edit, :update]

  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to shops_path, notice: '新規登録しました'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @shop.update(shop_params)
    redirect_to shops_path, notice: "店舗の編集をしました"
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :brand, :address, :start_dt, :end_dt, :datail, :url, :contact_detail)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def owner?
    unless current_owner
      redirect_to shops_path, notice: "エラー"
    end
  end
end
