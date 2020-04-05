class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :title,           null: false
      t.text       :content
      t.integer    :price,           null: false
      t.integer    :status,          null: false
      t.integer    :delivery_method  null: false
      t.integer    :delivery_origin, null: false
      t.integer    :delivery_days,   null: false
      t.boolean    :delivery_charge, null: false
      t.references :category,        foreign_key: true, null: false
      t.references :seller,          foreign_key: {to_table: :users}, null: false
      t.references :buyer,           foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
