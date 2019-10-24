class Changes2 < ActiveRecord::Migration[5.2]
  def change
  add_column :products, :user_id, :integer
  add_column :products, :buyer_id, :integer
  end
end
