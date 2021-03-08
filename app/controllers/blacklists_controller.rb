class BlacklistsController < ApplicationController
  def create
    shop = Shop.find(params[:shop_id])
    blacklist = shop.blacklists.create(user_id:params[:id])

  end

  def destroy
    blacklist = shop.blacklists.find_by()
  end
end
