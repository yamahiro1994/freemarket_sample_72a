class Image < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :user, optional: true
  belongs_to :category, optional: true
end
