class Blacklist < ApplicationRecord
  belongs_to :shop
  belongs_to :user
  validates :shop_id, uniqueness: { scope: :user_id }
end
