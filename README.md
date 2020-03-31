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


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|title          |text   |null: false|
<!-- 商品名はテキスト入力、必須項目 -->
|text           |text   |           |
<!-- 商品説明はテキスト入力、任意項目 -->
|size           |integer|null: false|
<!-- 商品サイズはプルダウン選択、必須項目 -->
|status         |integer|null: false|
<!-- 商品状態はプルダウン選択、必須項目 -->
|delivery_charge|integer|null: false|
<!-- 配送料は整数入力、必須項目 -->
|delivery_method|string |null: false|
<!-- 配送方法はプルダウン選択、必須項目 -->
|delivery_origin|text   |null: false|
<!-- 配送元地域はプルダウン選択、必須項目 -->
|delivery_days  |integer|null: false|
<!-- 配送するまでの日数はプルダウン選択、必須項目 -->
|price          |integer|null: false|
<!-- 商品の値段は整数入力、必須項目 -->
|indication     |?      |?          |
<!-- ？？？？？ -->

<!-- 外部キー -->
|seller_id  |integer  |null: false, foreign_key: true|
<!-- 出品者のIDは整数入力、必須項目、外部キー制約、usersの固有idから引用 -->
|buyer_id   |integer  |null: false, foreign_key: true|
<!-- 購入者のIDは整数入力、必須項目、外部キー制約、usersの固有idから引用 -->
|category_id|integer  |foreign_key: true             |
<!-- 商品に関連するカテゴリーはプルダウン入力、任意項目、外部キー制約、categoriesの固有IDから引用-->

<!-- |history_id|integer|foreign_key: true| -->
<!-- |brand_id|integer|foreign_key: true| -->

### Association
<!-- アソシエーション -->

- belongs_to :user
<!-- １人のユーザーは複数の商品を出品する -->
- belongs_to :category
<!-- １つのカテゴリーは複数の商品を含む -->

- has_many :bookmarks
<!-- 一つの商品は複数のユーザーからのブックマークをもらう -->
- has_many :comments
<!-- 一つの商品は複数のコメントを含む -->
- has_many :images
<!-- 一つの商品は複数の商品写真を含む -->

----------------------------------------------------------------------

## bookmarksテーブル
<!-- 中間テーブル -->
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
<!-- いいねした購入希望者のIDは整数入力、必須項目、外部キー制約、usersの固有idから引用 -->
|item_id|integer|null: false, foreign_key: true|
<!-- 購入希望者にいいねされた商品のIDは整数入力、必須項目、外部キー制約、itemsの固有idから引用 -->

### Association
<!-- アソシエーション -->
- belongs_to :user
- belongs_to :item
----------------------------------------------------------------------

## imageテーブル
|Column|Type|Options|
|---------|-------- |-----------------------------------|
|item_id|integer|null: false, foreign_key: true|
|image  |text|     |
### Association
- belongs_to :item

----------------------------------------------------------------------