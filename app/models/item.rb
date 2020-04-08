class Item < ApplicationRecord
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
end
