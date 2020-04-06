class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :title,           null: false
      t.text       :content,         null: false
      t.integer    :price,           null: false
      t.integer    :status,          null: false
      t.integer    :delivery_method
      t.string     :prefecture_id,   null: false
      t.integer    :delivery_days,   null: false
      t.integer    :delivery_charge, null: false
      t.references :category,        foreign_key: true
      t.references :seller,          foreign_key: {to_table: :users}
      t.references :buyer,           foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
