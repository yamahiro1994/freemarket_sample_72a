class Item < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :deliverycharge
  belongs_to_active_hash :deliverydays
  belongs_to_active_hash :deliverymethod
  belongs_to_active_hash :status
end
