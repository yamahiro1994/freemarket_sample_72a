class AddPublishedToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :publised, :boolean, default: false, null: false
  end
end
