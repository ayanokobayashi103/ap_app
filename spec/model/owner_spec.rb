require 'rails_helper'
describe 'ownerモデル機能', type: :model do

  describe 'バリデーションのテスト' do

    it 'ownerの電話番号が10~11桁であれば登録できる' do
      owner = FactoryBot.build(:owner, tel: "0123456789")
      owner.valid?
      expect(owner).to be_valid
    end
    it 'ownerの電話番号が10~11桁でなければ登録できないこと' do
      owner = FactoryBot.build(:owner, tel: "123456789")
      owner.valid?
      expect(owner.errors[:tel]).to include("は不正な値です")
    end
  end
end
