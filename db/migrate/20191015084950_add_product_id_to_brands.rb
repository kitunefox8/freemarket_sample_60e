class AddProductIdToBrands < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :product_id, :integer, foreign_key: true
  end
end
