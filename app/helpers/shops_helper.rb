module ShopsHelper
  def default_img(image)
    image.presence || 'default.jpg'
  end
  # def blacklist_user(review)
  #   @shop = Shop.find(review.shop_id)
  #   @user = review.user_id
  #   @shop.blacklists.find_by(user_id:@user).present?
  # end
end
