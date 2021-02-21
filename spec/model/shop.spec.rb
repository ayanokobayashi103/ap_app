require 'rails_helper'
describe 'shopモデル機能', type: :model do
  before do
    @owner = FactoryBot.create(:owner)
  end

  describe 'バリデーションのテスト' do
    context '店のnameが空の場合' do
      it 'バリデーションにひっかる' do
        shop = Shop.new(name: '', brand: 'brand',address:'Hawaii',start_dt:'10:00',end_dt:'17:00',detail:'Hawaian shop',contact_detail:'05012345678',owner:@owner)
        expect(shop).not_to be_valid
      end
    end
    context 'タスクの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        shop = Shop.new(name: 'name', brand: 'brand',address:'',start_dt:'10:00',end_dt:'17:00',detail:'Hawaian shop',contact_detail:'05012345678',owner:@owner)
        expect(shop).not_to be_valid
      end
    end
    context 'タスクのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        shop = Shop.new(name: 'name', brand: 'brand',address:'Hawaii',start_dt:'10:00',end_dt:'17:00',detail:'Hawaian shop',contact_detail:'05012345678',owner:@owner)
        expect(shop).to be_valid
      end
    end
  end
end
