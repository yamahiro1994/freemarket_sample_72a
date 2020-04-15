class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :message, presence: true
end
