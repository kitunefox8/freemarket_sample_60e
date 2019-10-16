class RenameCreditNamberColumnToCreditcards < ActiveRecord::Migration[5.2]
  def change
    rename_column :creditcards, :credit_namber, :credit_number
  end
end
