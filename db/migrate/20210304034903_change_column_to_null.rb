class ChangeColumnToNull < ActiveRecord::Migration[5.2]
  def up
    change_column_null :reviews, :rate, true
  end

  def down
    change_column_null :reviews, :rate, false
  end
end
