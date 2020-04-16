class ChangeDatatypeMunicipalityOfUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :municipality, :string
  end
  # ロールバックできなかった為、下記dwonは適当に作成
  def down
    change_column :users, :municipality, :text
  end
end
