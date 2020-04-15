class RenameTweetIdColumnToComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :tweet_id, :item_id
  end
end
