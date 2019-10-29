class AddColumnUsersAvatorCalloutIntroduction < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avator, :string
    add_column :users, :callout, :string
    add_column :users, :self_introduction, :string
  end
end
