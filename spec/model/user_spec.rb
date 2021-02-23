require 'rails_helper'
describe 'userモデル機能', type: :model do

  before do
    @owner = FactoryBot.create(:owner)
  end

  describe 'バリデーションのテスト' do
    context 'ユーザー名が空の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(
          name: '',
          email: "test@example.com",
          password: "password"
        )
        expect(user).not_to be_valid
      end
      it 'バリデーションを通る' do
        user = User.new(
          name: 'Ai',
          email: "test@example.com",
          password: "password"
        )
        expect(user).to be_valid
      end
    end
    context 'ユーザー名が長すぎる場合' do
      it "ユーザー名が3１文字以上の場合は登録できない" do
        user = User.new(
          name: "a" * 31,
          email: "test@example.com",
          password: "password")
          expect(user).to be_invalid
      end
    end
    context 'メールアドレスはユニークであるか' do
      it "メールアドレスが重複していないこと" do
        User.create(
          name: "Ai",
          email: "test@example.com",
          password: "i-am-ai"
        )
        @user = User.new(
          name: "You",
          email: "test@example.com",
          password: "i-am-you"
        )
        @user.valid?
        expect(@user.valid?).to eq(false)
      end
    end
  end
end
