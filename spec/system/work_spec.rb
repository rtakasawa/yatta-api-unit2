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
      click_on "学習を記録する"
    end
    it '教材登録のセレクトボックスには、登録した教材が表示される' do
      expect(page).to have_select('work[material_id]', options: [ "test1", "test2", "test3" ])
    end
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存される' do
        select "test1", from: 'work[material_id]'
        fill_in 'work[start]', with: "1-1"
        fill_in 'work[finish]', with: "1-10"
        fill_in "work[content]", with: 'とても難しいです。復習が必要です。'
        select "incomplete", from: 'work[status]'
        click_button "登録する"
        wait.until{ expect(page).to have_content "test1" }
        wait.until{ expect(page).to have_content "1-1" }
        wait.until{ expect(page).to have_content "1-10" }
        wait.until{ expect(page).to have_content "incomplete" }
      end
    end
  end

  describe '登録した学習情報の詳細画面' do
    before do
      User.create(id: 1, name: "sample", email: "sample@example.com", password: "0000000")
      FactoryBot.create(:material, user_id: 1)
      FactoryBot.create(:work, material_id: 1)
      visit new_user_session_path
      fill_in "user[email]", with: "sample@example.com"
      fill_in "user[password]", with: "0000000"
      click_on "ログイン"
      click_on "test1"
      click_on "詳細"
    end
    it '該当の教材名と学習情報が表示される' do
      wait.until{ expect(page).to have_content "test1" }
      wait.until{ expect(page).to have_content "1" }
      wait.until{ expect(page).to have_content "10" }
      wait.until{ expect(page).to have_content "難しい" }
      wait.until{ expect(page).to have_content "incomplete" }
    end
  end

  describe '登録した学習情報の編集画面' do
    before do
      User.create(id: 1, name: "sample", email: "sample@example.com", password: "0000000")
      FactoryBot.create(:material, user_id: 1)
      FactoryBot.create(:work, material_id: 1)
      visit new_user_session_path
      fill_in "user[email]", with: "sample@example.com"
      fill_in "user[password]", with: "0000000"
      click_on "ログイン"
      click_on "test1"
      click_on "詳細"
      click_on "編集"
    end
    it '該当の教材名が表示される' do
      wait.until{ expect(page).to have_content "test1" }
    end
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが更新される' do
        fill_in 'work[start]', with: "3-1"
        fill_in 'work[finish]', with: "3-3"
        fill_in "work[content]", with: '簡単でした'
        select "incomplete", from: 'work[status]'
        click_button "更新する"
        wait.until{ expect(page).to have_content "test1" }
        wait.until{ expect(page).to have_content "3-1" }
        wait.until{ expect(page).to have_content "3-3" }
        wait.until{ expect(page).to have_content "incomplete" }
      end
    end
  end

  describe '登録した学習情報の削除' do
    before do
      User.create(id: 1, name: "sample", email: "sample@example.com", password: "0000000")
      FactoryBot.create(:material, user_id: 1)
      FactoryBot.create(:work, material_id: 1)
      visit new_user_session_path
      fill_in "user[email]", with: "sample@example.com"
      fill_in "user[password]", with: "0000000"
      click_on "ログイン"
      click_on "test1"
      click_on "詳細"
      click_on "削除"
    end
    context '削除ボタンを押した場合' do
      it '削除した教材が表示されず、学習記録の登録がないメッセージが表示される' do
        page.accept_confirm
        wait.until{ expect(page).to have_no_content "難しい" }
        wait.until{ expect(page).to have_content "学習記録の登録はありません" }
      end
    end
  end
end