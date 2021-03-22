class Review < ApplicationRecord
  validates :content, presence: true, length: { maximum: 800 }
  validates :score, presence: true
  belongs_to :user
  belongs_to :shop
  has_many :comments, dependent: :destroy

  def score_percentage
    if self.score
      score.to_i*100/5
    else
      0.0
    end
  end
end
