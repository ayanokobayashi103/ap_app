require 'rails_helper'
describe 'userモデル機能', type: :model do

  describe 'バリデーションのテスト' do
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
