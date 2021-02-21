require 'rails_helper'
RSpec.describe 'Shop', type: :system do
  describe '新規作成機能' do
    before do
      FactoryBot.create(:owner)
      visit new_owner_session_path
      fill_in 'owner[email]', with:'owner@o.com'
      fill_in 'owner[password]', with:'ownerpass'
      click_button 'ログイン'
    end
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_shop_path
        fill_in 'shop[name]', with:'shop'
        fill_in 'shop[brand]', with:'shop'
        fill_in 'shop[address]', with:'Hokkaido'
        fill_in 'shop[start_dt]', with:'09:00'
        fill_in 'shop[end_dt]', with:'19:00'
        fill_in 'shop[detail]', with:'shop2'
        fill_in 'shop[contact_detail]', with:'0123456789'
        click_on '登録する'
        expect(page).to have_content '新規登録しました'
      end
    end
  end

  describe '検索機能' do
    before do
      @owner = FactoryBot.create(:owner)
      visit new_owner_session_path
      fill_in 'owner[email]', with:'owner@o.com'
      fill_in 'owner[password]', with:'ownerpass'
      click_button 'ログイン'
      FactoryBot.create(:shop, owner: @owner)
      FactoryBot.create(:shop2, owner: @owner)
    end
    context '店舗名で検索' do
      it '検索した店舗名が表示される' do
        visit root_path
        fill_in 'q[name_or_brand_or_address_cont]', with:'shop1'
        click_on '検索'
        expect(page).to have_content '店舗名:shop1'
      end
    end
    context 'ブランドで検索' do
      it '検索したブランド名を持つ店一覧が表示される' do
        visit root_path
        fill_in 'q[name_or_brand_or_address_cont]', with:'shopshop2'
        click_on '検索'
        expect(page).to have_content 'shop2'
      end
    end
    context '住所で検索' do
      it '検索した住所の店一覧が表示される' do
        visit root_path
        fill_in 'q[name_or_brand_or_address_cont]', with:'shopshop2'
        click_on '検索'
        expect(page).to have_content 'shop2'
      end
    end
  end
end
