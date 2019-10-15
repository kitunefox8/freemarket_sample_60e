class AddDeliveryFeeToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :delivery_fee, :integer
    add_column :products, :shipping_area, :integer
    add_column :products, :shipping_days, :integer
    add_column :products, :saller_id, :integer
    add_column :products, :category_id, :integer
    add_column :products, :status_id, :integer
    add_column :products, :brand_id, :integer
  end
end
