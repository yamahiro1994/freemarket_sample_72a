# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false
      t.string :encrypted_password, null: false
      
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.string  :nickname,                     null: false
      # t.string  :email,                        null: false, unique: true
      # t.string  :password,                     null: false
      # メールアドレス、ログインパスワードはdeviseのデフォルトで、７、８行目に記述済みのためここでは記述せず
      t.string  :family_name,                  null: false
      t.string  :family_name_kana,             null: false
      t.string  :user_name,                    null: false
      t.string  :user_name_kana,               null: false
      t.date    :birthday,                     null: false
      t.string  :destination_family_name,      null: false
      t.string  :destination_family_name_kana, null: false
      t.string  :destination_name,             null: false
      t.string  :destination_name_kana,        null: false
      t.integer :postal_code,                  null: false
      t.integer :prefectures,                  null: false
      t.integer :municipality,                 null: false
      t.string  :address,                      null: false
      t.string  :apartment_room_namber
      t.integer :phone_number

      t.timestamps null: false
    end
    
    # add_index :users, :email,                unique: true
    # add_index :users, :reset_password_token, unique: true
    # 59、60行目、記述する必要がないと判断しコメントアウトしました

    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end