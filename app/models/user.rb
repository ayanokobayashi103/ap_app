class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reviews, dependent: :destroy
end
