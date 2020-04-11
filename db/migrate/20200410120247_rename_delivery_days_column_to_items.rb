class RenameDeliveryDaysColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :delivery_days, :delivery_days_id
  end
end
