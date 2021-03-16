class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  before_action :owner?, only: [:new, :ceate, :edit, :update]

  def index
    # @shops = Shop.all
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true)
    # 評価順で並べるばあい
    if params[:sort_top_review]
      @shops= Shop.all.each do |shop|
        shop.average= shop.review_score_average
      end
      @shops=@shops.sort_by{ |shop| shop.average }.reverse
    end
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.owner_id = current_owner.id
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
    if @shop.update(shop_params)
      redirect_to owner_path(@shop.owner_id), notice: "店舗の編集をしました"
    else
      render :edit
    end
  end

  def destroy
    @shop.destroy
    redirect_to owner_path(@shop.owner_id), notice: '店舗を削除しました'
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :brand, :address, :start_dt, :end_dt, :detail, :url, :contact_detail, :image, :image_cache)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def owner?
    unless authenticate_owner!
      redirect_to shops_path, notice: "エラー"
    end
  end
end
