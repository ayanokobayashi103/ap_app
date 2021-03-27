require 'rails_helper'
RSpec.describe Blacklist, type: :model do
  describe 'ブラックリストに追加' do
    let(:user) { FactoryBot.create(:user) }
    let(:owner) { FactoryBot.create(:owner) }
    let(:shop) { FactoryBot.build(:shop, owner_id: owner.id) }

    it 'blacklist_userメソッドが有効か' do
      Blacklist.create(shop: shop, user: user )
      shop.blacklist_user(user)
    end
  end
end
