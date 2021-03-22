class BlacklistsController < ApplicationController
  before_action :authenticate_owner!
  before_action :set_review

  def create
    blacklist = @shop.blacklists.create(user_id: @user)
    # 一つ前のページに戻るページがみるからない場合にルートパスに飛ばす記述
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @blacklist = @shop.blacklists.find_by(user_id: @user)
    @blacklist.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def set_review
    @review = Review.find(params[:id])
    @shop = Shop.find(@review.shop_id)
    @user = @review.user_id
  end
end
