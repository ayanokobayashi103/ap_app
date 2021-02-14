class AddOwnerRefToShops < ActiveRecord::Migration[5.2]
  def change
    add_reference :shops, :owner, foreign_key: true
  end
end
