class Shop < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :address, presence: true
  validates :start_dt, presence: true
  validates :end_dt, presence: true
  belongs_to :owner
end
