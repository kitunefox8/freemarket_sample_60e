class AddProdactIdToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :product_id, :integer, foreign_key: true
  end
end
