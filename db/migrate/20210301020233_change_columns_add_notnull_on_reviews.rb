class ChangeColumnsAddNotnullOnReviews < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :rate, :float, default: '', null: false
  end
end
