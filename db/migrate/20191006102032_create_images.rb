class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :image_url, null: false
      t.timestamps
      t.integer :product_id, foreign_key: true
    end
  end
end
    