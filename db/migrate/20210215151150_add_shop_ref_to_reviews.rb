class AddShopRefToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :shop, foreign_key: true
  end
end
