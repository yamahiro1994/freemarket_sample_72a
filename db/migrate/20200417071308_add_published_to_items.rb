class AddPublishedToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :published, :boolean, default: false, null: false
  end
end
