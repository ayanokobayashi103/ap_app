class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.string :brand, null: false
      t.string :address, null: false
      t.string :start_dt, null: false
      t.string :end_dt, null: false
      t.text :detail, null: false
      t.string :url, null: false
      t.string :contact_detail, null: false
      t.string :image

      t.timestamps
    end
  end
end
