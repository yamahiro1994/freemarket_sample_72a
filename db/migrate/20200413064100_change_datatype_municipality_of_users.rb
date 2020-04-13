class ChangeDatatypeMunicipalityOfUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :municipality, :string
  end
end
