class Change < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :delivery_fee, :integer
    remove_column :products, :shipping_area, :integer
    remove_column :products, :shipping_days, :integer
    add_column :products, :delivery_fee, :string
    add_column :products, :shipping_area, :string
    add_column :products, :shipping_days, :string
  end
end
