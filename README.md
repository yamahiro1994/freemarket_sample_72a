# README

# FURIMA DB設計

## usersテーブル 
|Column|Type|Options|
|----------------------------|-------|-------------------------|
|nickname                    |string |null: false              | 
|email                       |string |null: false, unique: true|
|password                    |string |null: false              |
|family_name                 |string |null: false              |
|family_name_kana            |string |null: false              |
|user_name                   |string |null: false              |
|user_name_kana              |string |null: false              |
|birthday                    |date   |null: false              |
|destination_family_name     |string |null: false              |
|destination_family_name_kana|string |null: false              |
|destination_name            |string |null: false              |
|destination_name_kana       |string |null: false              |
|postal_code                 |integer|null: false              |
|prefectures                 |integer|null: false              |
|municpality                 |integer|null: false              |
|address                     |string |null: false              |
|apartment_room_namber       |text   |null: false              |
|phone_number                |integer|null: false              |

### Association
- has_many   :items
- has_many   :cerds
- has_many   :bookmarks
- belongs_to :item, through: :bookmarks
- has_many   :commentss
- belongs_to :item, through: :comments

## cardsテーブル
|Column         |Type   |Options                       |
|---------------|-------|------------------------------|
|number         |integer|null: false, unique: true     |
|name           |string |null: false                   |
|expiration_date|integer|null: false                   |
|security_code  |integer|null: false                   |
|user_id        |integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## categoriesテーブル
|Column|Type--|Options    |
|------|------|-----------|
|name--|string|null: false|

### Association
- has_many :items
