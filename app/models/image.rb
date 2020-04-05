class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :item, optional: true
  belongs_to :user, optional: true
  belongs_to :category, optional: true
end
