class AddProductIdToStatuses < ActiveRecord::Migration[5.2]
  def change
    add_column :statuses, :product_id, :integer, foreign_key: true
  end
end
