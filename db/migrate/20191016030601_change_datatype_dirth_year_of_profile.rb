class ChangeDatatypeDirthYearOfProfile < ActiveRecord::Migration[5.2]
  def change
    change_column :profiles, :birth_year, :integer, null: false
    change_column :profiles, :birth_month, :integer, null: false
    change_column :profiles, :birth_day, :integer, null: false
  end
end