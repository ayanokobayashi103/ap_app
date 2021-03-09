class BlacklistsController < ApplicationController
  before_action :authenticate_owner!
  before_action :set_review

  def create
    blacklist = @shop.blacklists.create(user_id:@user)
  end

  def destroy
    @blacklist = @shop.blacklists.find_by(user_id:@user)
    @blacklist.destroy
  end

  private
  def set_review
    @review = Review.find(params[:id])
    @shop = Shop.find(@review.shop_id)
    @user = @review.user_id
  end
end
