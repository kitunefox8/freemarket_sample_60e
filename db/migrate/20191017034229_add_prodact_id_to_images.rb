class AddProdactIdToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :prodact_id, :integer, foreign_key: true
  end
end
