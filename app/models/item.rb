class Item < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true

  enum status:{
    '---':           0, #---
    unused:          1, #新品、未使用
    nearly_unused:   2, #未使用に近い
    not_injured:     3, #目立った傷や汚れなし
    bit_injured:     4, #やや傷や汚れあり
    injured:         5, #傷や汚れあり
    bad:             6, #全体的に状態が悪い
  }
  enum delivery_method:{
    large:          1, #大型配送
    normal:         2, #中型配送
    small:          3, #小型配送
  }
  enum delivery_days:{
    fast:          1, #1~2日で発送
    medium:        2, #3~4日で発送
    slow:          3, #5~7日で発送
  }
  enum delivery_charge:{
    donor:          1, #着払い(購入者負担)
    recipient:      2, #送料込み(出品者負担)
  }
  enum prefecture_id:{
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  }
end
