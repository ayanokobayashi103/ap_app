class Shop < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :address, presence: true
  VALID_TIME_REGEX = /\A\d{2}:\d{2}$|^\d{1}:\d{2}\z/
  validates :start_dt, presence: true, format: { with: VALID_TIME_REGEX }
  validates :end_dt, presence: true, format: { with: VALID_TIME_REGEX }
  validates :detail, length: { maximum: 500 }
  VALID_TEL_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :contact_detail, format: { with: VALID_TEL_REGEX }
  validates :url, allow_blank: true, format: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/
  belongs_to :owner
  has_many :reviews, dependent: :destroy
  has_many :review_users, through: :reviews, source: :user
  mount_uploader :image, ImageUploader
  has_many :blacklists, dependent: :destroy
  has_many :blacklist_users, through: :blacklists, source: :user
  attr_accessor :average
  attr_accessor :review_count

  def review_score_percentage
    if reviews
      reviews.average(:score).to_f * 100 / 5
    else
      0.0
    end
  end

  def review_score_average
    if reviews
      reviews.average(:score).to_f.round(1)
    else
      0.0
    end
  end

  def blacklist_user(user)
    blacklists.find_by(user_id: user).present?
  end
end
