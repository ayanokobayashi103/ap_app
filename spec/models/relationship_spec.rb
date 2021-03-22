require 'rails_helper'
describe 'relationshipモデル機能', type: :model do
  describe 'フォロー機能のテスト' do
    let(:user) { FactoryBot.create(:user) } # => フォローしているユーザ
    let(:user2) { FactoryBot.create(:user2) } # => フォローされているユーザ
    let(:active) { user.active_relationships.build(followed_id: user2.id) }

    describe 'バリデーションのテスト' do
      it 'リレーションシップが有効であること' do
        active.valid?
        expect(active).to be_valid
      end
    end

    describe 'フォロー機能のテスト' do
      it 'followメソッドは、フォローしているユーザを返すこと' do
        expect(active.follower).to eq user
      end
      it 'followerメソッドは、フォローされているユーザを返すこと' do
        expect(active.followed).to eq user2
      end
    end
  end
end
