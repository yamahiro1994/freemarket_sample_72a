class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :message, presence: true, length: { maximum: 77 }
end