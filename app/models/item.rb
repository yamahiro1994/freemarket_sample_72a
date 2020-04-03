class Item < ApplicationRecord
  
  belongs_to :user
  belongs_to :category
  has_many :images

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
    '---':          0, #---
    large:          1, #大型配送
    normal:         2, #中型配送
    small:          3, #小型配送
  }

  enum delivery_origin:{
    '---':             0,
    hokkaido:          1,
    aomori:            2,
    iwate:             3,
    miyagi:            4,
    akita:             5,
    yamagata:          6,
    fukushima:         7,
    ibaragi:           8,
    tochigi:           9,
    gunma:             10,
    saitama:           11,
    chiba:             12,
    tokyo:             13,
    kanagawa:          14,
    niigata:           15,
    toyama:            16,
    ishikawa:          17,
    fukui:             18,
    yamanashi:         19,
    naganao:           20,
    gifu:              21,
    shizuoka:          22,
    aichi:             23,
    mie:               24,
    shiga:             25,
    kyoto:             26,
    osaka:             27,
    hyogo:             28,
    nara:              29,
    wakayama:          30,
    tottori:           31,
    shimane:           32,
    okayama:           33,
    hiroshima:         34,
    yamaguchi:         35,
    tokushima:         36,
    kagawa:            37,
    ehime:             38,
    kochi:             39,
    fukuoka:           40,
    saga:              41,
    nagasaki:          42,
    kumamoto:          43,
    ooita:             44,
    miyazaki:          45,
    kagoshima:         46,
    okinawa:           47,
  }
end
