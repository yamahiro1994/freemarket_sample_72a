class Item < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  has_many :images, dependent: :destroy

  validates :published, presence: true, if: true?
  
  validates :images, presence: true

  accepts_nested_attributes_for :images, allow_destroy: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_days
  belongs_to_active_hash :delivery_method
  belongs_to_active_hash :status
end
