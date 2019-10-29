class Changes6 < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :profile_id, :integer
  end
end
