class AddOwnerRefToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :owner, foreign_key: true
  end
end
