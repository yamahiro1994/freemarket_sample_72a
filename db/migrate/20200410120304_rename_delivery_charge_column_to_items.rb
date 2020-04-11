class RenameDeliveryChargeColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :delivery_charge, :delivery_charge_id
  end
end
