class Shop < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :address, presence: true
  validates :start_dt, presence: true
  validates :end_dt, presence: true
  belongs_to :owner
  has_many :reviews, dependent: :destroy
  has_many :review_users, throgh: :reviews, souce: :user
end
