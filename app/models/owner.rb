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
  has_many :shops, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.guest_owner
    find_or_create_by!(
      email: 'guest@example.com',
      name: 'ゲストユーザー',
      company: 'guest.co',
      postcode: '1234567',
      tel: '1234567890',
      ) do |owner|
    # ランダムで URL-safe な base64 文字列を生成して返します。
    owner.password = SecureRandom.urlsafe_base64
    end
  end

end
