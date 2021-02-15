class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutableand :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  VALID_TEL_REGEX = /\A\d{10}$|^\d{11}\z/
  VALID_POSTCODE_REGEX = /\A\d{7}\z/
  validates :name, presence: true, length: { maximum: 30 }
  validates :company, presence: true
  validates :tel, presence: true, format: { with: VALID_TEL_REGEX }
  validates :postcode, presence: true, format: { with: VALID_POSTCODE_REGEX }
  has_many :shops
end
