class Comment < ApplicationRecord
  belongs_to :review
  belongs_to :owner
  validates :content, presence: true, length: { maximum: 500 }
end
