class AddBuyerToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :buyer, :string
  end
end
