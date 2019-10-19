class RemoveProductIdFromCategoryStatusBrand < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :product_id, :integer, foreign_key: true
    remove_column :statuses, :product_id, :integer, foreign_key: true
    remove_column :brands, :product_id, :integer, foreign_key: true
    add_reference :categories, :product, foreign_key: true
    add_reference :statuses, :product, foreign_key: true
    add_reference :brands, :product, foreign_key: true
  end
end