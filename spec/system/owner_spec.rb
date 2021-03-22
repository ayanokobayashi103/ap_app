require 'rails_helper'
RSpec.describe 'Owner', type: :system do
  describe '店主登録のテスト' do
    context '店主の新規登録ができること' do
      it 'noticeが表示される' do
        visit new_owner_registration_path
        fill_in 'owner[name]', with: 'name'
        fill_in 'owner[email]', with: 'email@e.com'
        fill_in 'owner[password]', with: 'password'
        fill_in 'owner[password_confirmation]', with: 'password'
        fill_in 'owner[company]', with: 'company'
        fill_in 'owner[tel]', with: '09011112222'
        fill_in 'owner[postcode]', with: '1234567'
        click_on 'アカウント登録'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end
  end

  describe 'セッション機能のテスト' do
    before do
      @owner = FactoryBot.create(:owner)
      @owner2 = FactoryBot.create(:owner2)
      visit new_owner_session_path
      fill_in 'owner[email]', with: 'owner@o.com'
      fill_in 'owner[password]', with: 'ownerpass'
      click_button 'ログイン'
      FactoryBot.create(:shop2, owner: @owner)
    end
    context 'ログインができること' do
      it 'ログインページに遷移' do
        expect(page).to have_content 'ログインしました!'
      end
    end
    context '登録した店舗一覧画面に遷移' do
      it '登録した店舗が表示される' do
        visit owner_path(@owner)
        expect(page).to have_content 'shop2'
      end
    end
    context '登録した店舗の編集ができる' do
      it '編集した店舗の内容が表示される' do
        visit owner_path(@owner)
        find('#edit-shop').click
        fill_in 'shop[name]', with: 'shopshop'
        click_on '更新する'
        visit owner_path(@owner)
        expect(page).to have_content 'shopshop'
      end
    end
    context '他店主の詳細ページは見れない' do
      it 'メインページに遷移される' do
        visit owner_path(@owner2)
        expect(page).to have_content 'エラー'
      end
    end
    context 'ユーザーのページ詳細ページに飛べない' do
      it 'ログインページに遷移する' do
        user = FactoryBot.create(:user)
        visit user_path(user)
        expect(page).to have_content 'ログインしてください'
      end
    end
    context 'ログアウトができること' do
      it 'ログアウトしたことがわかる表示が出る' do
        visit root_path
        click_link 'ログアウト'
        expect(page).to have_content 'ログアウトしました!'
      end
    end
  end
end
