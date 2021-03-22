require 'rails_helper'
describe 'reviewpモデル機能', type: :model do
  before do
    @owner = FactoryBot.create(:owner)
    @user = FactoryBot.create(:user)
    @shop = FactoryBot.create(:shop, owner: @owner)
  end

  describe 'バリデーションのテスト' do
    context 'バリデーションにひっかかる' do
      it '内容が空の場合' do
        review = Review.new(
          content: '',
          user: @user,
          shop: @shop
        )
        expect(review).not_to be_valid
      end
      it '評価が空の場合' do
        review = Review.new(
          content: 'いいね',
          score: '',
          user: @user,
          shop: @shop
        )
        expect(review).not_to be_valid
      end
      it 'バリデーションに通る' do
        review = Review.new(
          content: 'good',
          score: 1,
          user: @user,
          shop: @shop
        )
        expect(review).to be_valid
      end
    end
  end
end
