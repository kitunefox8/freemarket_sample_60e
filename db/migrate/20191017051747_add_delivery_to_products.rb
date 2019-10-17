class AddDeliveryToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :delivery, :string
  end
end
