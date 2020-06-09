require 'rails_helper'

RSpec.describe '学習管理機能', type: :system do

  wait = Selenium::WebDriver::Wait.new(:timeout => 1000)

  describe '学習登録画面' do
    before do
      User.create(id: 1, name: "sample", email: "sample@example.com", password: "0000000")
      FactoryBot.create(:material, user_id: 1)
      FactoryBot.create(:second_material, user_id: 1)
      FactoryBot.create(:third_material, user_id: 1)
      visit new_user_session_path
      fill_in "user[email]", with: "sample@example.com"
      fill_in "user[password]", with: "0000000"
      click_on "ログイン"
    end

    it '教材登録のセレクトボックスには、登録した教材が表示される' do

    end
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存される' do
      end
    end
  end

  describe '登録した学習情報の編集画面' do
    it '該当の教材名が表示される' do
    end
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存される' do
      end
    end
  end

  describe '任意の教材を削除した場合' do
    it '削除した教材が表示されない' do
      # click_link "削除", href: "/materials/1"
      # page.accept_confirm
      # wait.until{ expect(page).to have_no_content 'test1' }
    end
  end
end

  # 教材一覧画面に最新の学習情報を表示
  # 教材詳細画面に学習情報が全て記載
  # →materialspecにて確認