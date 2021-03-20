class CreateBlacklists < ActiveRecord::Migration[5.2]
  def change
    create_table :blacklists do |t|
      t.references :shop, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :blacklists, [:shop_id, :user_id], unique: true
  end
end
