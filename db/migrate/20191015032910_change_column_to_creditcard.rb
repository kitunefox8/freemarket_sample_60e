class ChangeColumnToCreditcard < ActiveRecord::Migration[5.2]
  def change
    change_column :creditcards, :credit_namber, :string, null: false
    add_column :creditcards, :validity_month, :integer, null: false
    add_column :creditcards, :validity_day, :integer, null: false
    add_column :creditcards, :security_number, :integer, null: false
  end
end
