class RemoveUserIdFromSnscredentials < ActiveRecord::Migration[5.2]
  def change
    remove_column :snscredentials, :user_id, :integer
    add_reference :snscredentials, :user, foreign_key: true
    add_column :snscredentials, :uid, :string
  end
end
