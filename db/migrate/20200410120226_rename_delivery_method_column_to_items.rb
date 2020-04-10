class RenameDeliveryMethodColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :delivery_method, :delivery_method_id
  end
end
