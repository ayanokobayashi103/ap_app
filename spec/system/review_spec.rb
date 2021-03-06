require 'rails_helper'
RSpec.describe 'Review', type: :system do
  describe '新規作成機能' do
    before do
      FactoryBot.create(:user)
      @owner = FactoryBot.create(:owner)
      @shop = FactoryBot.create(:shop, owner: @owner)
      visit new_user_session_path
      fill_in 'user[email]', with:'user@u.com'
      fill_in 'user[password]', with:'userpass1'
      click_button 'ログイン'
    end
    context 'クチコミを新規作成した場合' do
      it '作成したクチコミが表示される' do
        visit shop_reviews_path(@shop)
        click_on 'クチコミする'
        fill_in 'review[content]', with:'いいね'
        find("input[name='review[score]'][value='3']").set(true)
        click_on '投稿する'
        expect(page).to have_content 'いいね'
        expect(page).to have_content 'クチコミ投稿しました！'
      end
    end
  end

  describe '新規作成機能' do
    before do
      @user = FactoryBot.create(:user)
      @owner = FactoryBot.create(:owner)
      @shop = FactoryBot.create(:shop, owner: @owner)
      @review = FactoryBot.create(:review, shop: @shop, user:@user)
      visit new_user_session_path
      fill_in 'user[email]', with:'user@u.com'
      fill_in 'user[password]', with:'userpass1'
      click_button 'ログイン'
    end
    context 'クチコミを編集できる' do
      it '編集した内容が表示される' do
        visit edit_shop_review_path(@shop, @review)
        fill_in 'review[content]', with:'とてもいいね'
        click_on '投稿する'
        expect(page).to have_content 'とてもいいね'
        expect(page).to have_content 'クチコミを編集しました！'
      end
    end
    context 'クチコミを削除できる' do
      it '削除した内容が表示されていない' do
        visit shop_reviews_path(@shop)
        click_on '削除する'
        page.accept_confirm
        expect(page).to have_content '削除しました'
        expect(page).not_to have_content 'とてもいいね'
      end
    end
  end
end
