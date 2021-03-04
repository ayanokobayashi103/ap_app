class Review < ApplicationRecord
  validates :content, presence: true, length: { maximum: 800 }
  belongs_to :user
  belongs_to :shop

  def score_percentage
    if self.score
      score.to_i*100/5
    else
      0.0
    end
  end
end
