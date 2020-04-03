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
|municipality                |integer|null: false              |
|address                     |string |null: false              |
|apartment_room_namber       |string |                         |
|phone_number                |integer|                         |

### Association
- has_many   :items
- has_many   :cards
- has_many   :bookmarks
- has_many   :comments
- has_many  :bookmarked_items, through: :bookmarks, source: :item
- has_many  :commented_items, through: :comments, source: :item

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
|Column  |Type  |Options|
|--------|------||
|name    |string|index: true, null: false|
|ancestry|string|index: true|

### Association
- has_many :items


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|title          |string   |null: false|
|body           |text   |           |
|status         |integer|null: false|
|delivery_charge|integer|null: false|
|delivery_method|string |null: false|
|delivery_origin|string   |null: false|
|delivery_days  |integer|null: false|
|price          |integer|null: false|
|seller_id  |integer  |null: false, foreign_key: true|
|buyer_id   |integer  |null: false, foreign_key: true|
|category_id|integer  |null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :category
- has_many :bookmarks
- has_many :comments
- has_many :images
- has_many :bookmarked_users, through: :bookmarks, source: :user
- has_many :commented_users, through: :comments, source: :user


## bookmarksテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## imageテーブル
|Column|Type|Options|
|---------|-------- |-----------------------------------|
|item_id|integer|null: false, foreign_key: true|
|image  |text     |

### Association
- belongs_to :item
