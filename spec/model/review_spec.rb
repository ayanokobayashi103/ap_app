require 'rails_helper'
describe 'reviewpモデル機能', type: :model do
  before do
    @owner = FactoryBot.create(:owner)
    @user = FactoryBot.create(:user)
    @shop = FactoryBot.create(:shop, owner:@owner)
  end

  describe 'バリデーションのテスト' do
    context '内容が空の場合' do
      it 'バリデーションにひっかかる' do
        review = Review.new(
          content: '',
          user:@user,
          shop:@shop
        )
        expect(review).not_to be_valid
      end
      it 'バリデーションに通る' do
        review = Review.new(
          content: 'good',
          user:@user,
          shop:@shop
        )
        expect(review).to be_valid
      end
    end
  end
end
