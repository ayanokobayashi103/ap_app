class RemoveOwnerIdFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :reviews, :owners
    remove_index :reviews, :owner_id
    remove_column :reviews, :owner_id, :bigint
  end
end
