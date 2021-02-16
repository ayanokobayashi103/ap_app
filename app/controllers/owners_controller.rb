class OwnersController < ApplicationController
  before_action :authenticate_owner!

  def shop
    @shops = Shop.select(:id,:name,:address)
  end

end
