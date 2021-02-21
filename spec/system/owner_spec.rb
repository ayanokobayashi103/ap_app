require 'rails_helper'
RSpec.describe 'User', type: :system do
  before do
    FactoryBot.create(:owner)
  end
  describe '店主登録のテスト' do
    context '店主の新規登録ができること' do
      it 'noticeが表示される' do
        visit new_owner_registration_path
        fill_in 'owner[name]', with:'name'
        fill_in 'owner[email]', with:'email@e.com'
        fill_in 'owner[password]', with:'password'
        fill_in 'owner[password_confirmation]', with:'password'
        fill_in 'owner[company]', with:'company'
        fill_in 'owner[tel]', with:'09011112222'
        fill_in 'owner[postcode]', with:'1234567'
        click_on 'アカウント登録'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end
  end

  # describe 'セッション機能のテスト' do
  #   before do
  #     visit new_user_session_path
  #     fill_in 'user[email]', with:'user@u.com'
  #     fill_in 'user[password]', with:'userpass1'
  #     click_button 'ログイン'
  #   end
  #   context 'ログインができること' do
  #     it 'ログインページに遷移' do
  #       expect(page).to have_content 'ログインしました!'
  #     end
  #   end
  #   context '自分の詳細画面(マイページ)に飛べること' do
  #     it 'マイページが表示される' do
  #       visit root_path
  #       click_link 'マイページ'
  #       expect(page).to have_content 'user1さんのページ'
  #     end
  #   end
  #
  # end
end
