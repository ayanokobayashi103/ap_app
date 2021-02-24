class Review < ApplicationRecord
  validates :content, presence: true, length: { maximum: 800 }
  belongs_to :user
  belongs_to :shop
end
