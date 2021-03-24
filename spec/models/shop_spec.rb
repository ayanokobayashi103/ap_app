require 'rails_helper'
describe 'shopモデル機能', type: :model do
  before do
    @owner = FactoryBot.create(:owner)
  end

  describe 'バリデーションのテスト' do
    context '店名が空の場合' do
      it 'バリデーションにひっかかる' do
        shop = Shop.new(
          name: '',
          brand: 'brand',
          address: 'Hawaii',
          start_dt: '10:00',
          end_dt: '17:00',
          detail: 'Hawaian shop',
          contact_detail: '05012345678',
          owner: @owner
        )
        expect(shop).not_to be_valid
      end
    end
    context '店の住所が空の場合' do
      it 'バリデーションにひっかかる' do
        shop = Shop.new(
          name: 'name',
          brand: 'brand',
          address: '',
          start_dt: '10:00',
          end_dt: '17:00',
          detail: 'Hawaian shop',
          contact_detail: '05012345678',
          owner: @owner
        )
        expect(shop).not_to be_valid
      end
    end
    context '全て記載されている場合' do
      it 'バリデーションを通る' do
        shop = Shop.new(
          name: 'name',
          brand: 'brand',
          address: 'Hawaii',
          start_dt: '10:00',
          end_dt: '17:00',
          detail: 'Hawaian shop',
          contact_detail: '05012345678',
          owner: @owner
        )
        expect(shop).to be_valid
      end
    end
    context '営業開始時間の入力方法が違う場合' do
      it 'バリデーションにひっかかる' do
        shop = FactoryBot.build(:shop, owner: @owner, start_dt: '10:00')
        expect(shop).to be_valid
      end
      it 'バリデーションを通る' do
        shop = FactoryBot.build(:shop, owner: @owner, start_dt: '1000')
        shop.valid?
        expect(shop.errors[:start_dt]).to include('は不正な値です')
      end
    end
  end
end
