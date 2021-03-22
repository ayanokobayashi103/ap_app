require 'rails_helper'
RSpec.describe 'Shop', type: :system do
  describe '新規作成機能' do
    before do
      FactoryBot.create(:owner)
      visit new_owner_session_path
      fill_in 'owner[email]', with: 'owner@o.com'
      fill_in 'owner[password]', with: 'ownerpass'
      click_button 'ログイン'
    end
    context '店を新規作成した場合' do
      it '作成した店が表示される' do
        visit new_shop_path
        fill_in 'shop[name]', with: 'shop'
        fill_in 'shop[brand]', with: 'shop'
        fill_in 'shop[address]', with: 'Hokkaido'
        fill_in 'shop[start_dt]', with: '09:00'
        fill_in 'shop[end_dt]', with: '19:00'
        fill_in 'shop[detail]', with: 'shop2'
        fill_in 'shop[contact_detail]', with: '0123456789'
        click_on '登録する'
        expect(page).to have_content '新規登録しました'
      end
    end
  end

  describe '検索機能' do
    before do
      @owner = FactoryBot.create(:owner)
      @user = FactoryBot.create(:user)
      @shop = FactoryBot.create(:shop, owner: @owner)
      @shop2 = FactoryBot.create(:shop2, owner: @owner)
      FactoryBot.create(:review, user: @user, shop: @shop)
      FactoryBot.create(:review2, user: @user, shop: @shop)
      FactoryBot.create(:review3, user: @user, shop: @shop2)
    end
    context '店舗名で検索' do
      it '検索した店舗名が表示される' do
        visit root_path
        fill_in 'q[name_or_brand_or_address_cont]', with: 'shop1'
        click_on '検索'
        expect(page).to have_content '店舗名:shop1'
      end
    end
    context 'ブランドで検索' do
      it '検索したブランド名を持つ店一覧が表示される' do
        visit root_path
        fill_in 'q[name_or_brand_or_address_cont]', with: 'shopshop2'
        click_on '検索'
        expect(page).to have_content 'shop2'
      end
    end
    context '住所で検索' do
      it '検索した住所の店一覧が表示される' do
        visit root_path
        fill_in 'q[name_or_brand_or_address_cont]', with: 'shopshop2'
        click_on '検索'
        expect(page).to have_content 'shop2'
      end
    end
    context '検索するがヒットしない' do
      it '検索内容が見つからないと表示される' do
        visit root_path
        fill_in 'q[name_or_brand_or_address_cont]', with: 'hogehoge'
        click_on '検索'
        expect(page).to have_content '検索条件と一致する結果が見つかりません'
      end
    end
    context 'クチコミランキングでソート' do
      it 'クチコミ評価の一番良い店が一番上に表示' do
        visit root_path
        click_on 'クチコミ評価が良い店Top10'
        top = all('.review-post')
        sleep(1)
        expect(top[0]).to have_content 'shop2'
        expect(top[1]).to have_content 'shop'
      end
    end
  end
end
