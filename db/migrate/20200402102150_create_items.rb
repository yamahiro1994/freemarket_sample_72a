class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :title,           null: false
      t.text       :content,         null: false
      t.integer    :price,           null: false
      t.string     :status,          null: false
      t.string     :delivery_method, null: false
      t.integer    :prefecture_id,   null: false
      t.string    :delivery_days,   null: false
      t.integer    :delivery_charge, null: false
      t.references :category,        foreign_key: true
      t.references :seller,          foreign_key: {to_table: :users}
      t.references :buyer,           foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
