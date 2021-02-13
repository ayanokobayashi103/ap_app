class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :content, null: false
      t.integer :score
      t.string :image

      t.timestamps
    end
  end
end
