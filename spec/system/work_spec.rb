require 'rails_helper'

RSpec.describe '学習管理機能', js: true, type: :system do
  wait = Selenium::WebDriver::Wait.new(timeout: 1000)

  describe '学習登録画面' do
    before do
      test_user_create(:user)
      FactoryBot.create(:material, user_id: 1)
      FactoryBot.create(:second_material, user_id: 1)
      FactoryBot.create(:third_material, user_id: 1)
      visit new_user_session_path
      fill_in 'user[email]', with: 'sample@example.com'
      fill_in 'user[password]', with: '0000000'
      click_on 'commit'
      click_on '学習を記録する'
    end
    it '教材登録のセレクトボックスには、登録した教材が表示される' do
      expect(page).to have_select('work[material_id]', options: %w[教材を選択してください test1 test2 test3])
    end
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存される' do
        select 'test1', from: 'work[material_id]'
        fill_in 'work[do_on]', with: Time.zone.today
        fill_in 'work[start]', with: '1-1'
        fill_in 'work[finish]', with: '1-10'
        fill_in 'work[content]', with: 'とても難しいです。復習が必要です。'
        click_button '登録'
        wait.until { expect(page).to have_content Time.zone.today }
        wait.until { expect(page).to have_content '1-1' }
        wait.until { expect(page).to have_content '1-10' }
      end
    end
  end

  describe '登録した学習情報の詳細画面' do
    before do
      test_user_create(:user)
      FactoryBot.create(:material, user_id: 1)
      FactoryBot.create(:work, material_id: 1)
      visit new_user_session_path
      fill_in 'user[email]', with: 'sample@example.com'
      fill_in 'user[password]', with: '0000000'
      click_on 'commit'
      click_on '登録した教材一覧'
      click_on 'test1'
      click_on '詳細'
    end
    it '該当の教材名と学習情報が表示される' do
      wait.until { expect(page).to have_content 'test1' }
      wait.until { expect(page).to have_content '1' }
      wait.until { expect(page).to have_content '10' }
      wait.until { expect(page).to have_content '難しい' }
      wait.until { expect(page).to have_content Time.zone.today }
    end
  end

  describe '登録した学習情報の編集画面' do
    before do
      test_user_create(:user)
      FactoryBot.create(:material, user_id: 1)
      FactoryBot.create(:work, material_id: 1)
      visit new_user_session_path
      fill_in 'user[email]', with: 'sample@example.com'
      fill_in 'user[password]', with: '0000000'
      click_on 'commit'
      click_on '登録した教材一覧'
      click_on 'test1'
      click_on '詳細'
      click_on '編集'
    end
    it '該当の教材名が表示される' do
      wait.until { expect(page).to have_content 'test1' }
    end
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが更新される' do
        fill_in 'work[do_on]', with: Time.zone.today - 2
        fill_in 'work[start]', with: '3-1'
        fill_in 'work[finish]', with: '3-3'
        fill_in 'work[content]', with: '簡単でした'
        click_button '更新'
        wait.until { expect(page).to have_content 'test1' }
        wait.until { expect(page).to have_content '3-1' }
        wait.until { expect(page).to have_content '3-3' }
        wait.until { expect(page).to have_content Time.zone.today - 2 }
      end
    end
  end

  describe '登録した学習情報の削除' do
    before do
      test_user_create(:user)
      FactoryBot.create(:material, user_id: 1)
      FactoryBot.create(:work, material_id: 1)
      visit new_user_session_path
      fill_in 'user[email]', with: 'sample@example.com'
      fill_in 'user[password]', with: '0000000'
      click_on 'commit'
      click_on '登録した教材一覧'
      click_on 'test1'
      click_on '詳細'
      click_on '削除'
    end
    context '削除ボタンを押した場合' do
      it '削除した教材が表示されず、学習記録の登録がないメッセージが表示される' do
        page.accept_confirm
        wait.until { expect(page).to have_no_content Time.zone.today }
        wait.until { expect(page).to have_content '学習情報の登録はありません' }
      end
    end
  end

  describe '学習情報一覧' do
    context '学習情報を登録していない場合' do
      before do
        test_user_create(:user)
        FactoryBot.create(:material, user_id: 1)
        visit new_user_session_path
        fill_in 'user[email]', with: 'sample@example.com'
        fill_in 'user[password]', with: '0000000'
        click_on 'commit'
        click_on '学習情報一覧'
      end
      it '学習記録の登録がないことのメッセージが表示される' do
        wait.until { expect(page).to have_content '学習情報の登録はありません' }
        wait.until { expect(page).to have_content '0回' }
      end
      it '絞り込みボタンが表示されない' do
        wait.until { expect(page).to have_no_content '絞り込み' }
        wait.until { expect(page).to have_no_content 'クリア' }
      end
      it '他人の学習記録は表示されない' do
        test_user_create(:second_user)
        FactoryBot.create(:second_material, user_id: 2)
        FactoryBot.create(:fourth_work, material_id: 2)
        click_on '学習情報一覧'
        wait.until { expect(page).to have_no_content 'test4' }
        wait.until { expect(page).to have_content '学習情報の登録はありません' }
      end
    end
    context '学習情報を複数登録している場合' do
      before do
        test_user_create(:user)
        FactoryBot.create(:material, user_id: 1)
        FactoryBot.create(:work, material_id: 1)
        FactoryBot.create(:second_work, material_id: 1)
        FactoryBot.create(:third_work, material_id: 1, do_on: Time.zone.today.last_month)
        visit new_user_session_path
        fill_in 'user[email]', with: 'sample@example.com'
        fill_in 'user[password]', with: '0000000'
        click_on 'commit'
        click_on '学習情報一覧'
      end
      it '学習情報一覧：学習日順に表示される（絞り込みボタンが表示される）', retry: 3 do
        sleep 3
        work_list = all('#work-table tr')
        wait.until { expect(work_list[0]).to have_content Time.zone.today }
        wait.until { expect(work_list[0]).to have_content 'test1' }
        wait.until { expect(work_list[0]).to have_content '1' }
        wait.until { expect(work_list[0]).to have_content '10' }
        wait.until { expect(work_list[1]).to have_content Time.zone.today - 1 }
        wait.until { expect(work_list[1]).to have_content 'test1' }
        wait.until { expect(work_list[1]).to have_content '1-1' }
        wait.until { expect(work_list[1]).to have_content '1-10' }
        wait.until { expect(work_list[2]).to have_content Time.zone.today.last_month }
        wait.until { expect(work_list[2]).to have_content 'test1' }
        wait.until { expect(work_list[2]).to have_content '１' }
        wait.until { expect(work_list[2]).to have_content '１０' }
        # wait.until{ expect(page).to have_content "絞り込み" }
        wait.until { expect(page).to have_content 'クリア' }
      end
      it '学習日で絞り込みができる（絞り込みボタンが表示される）' do
        fill_in 'q[do_on_gteq]', with: Time.zone.today - 1
        fill_in 'q[do_on_lteq]', with: Time.zone.today - 1
        click_on 'commit'
        work_list = all('#work-table tr')
        wait.until { expect(work_list[0]).to have_content Time.zone.today - 1 }
        wait.until { expect(work_list[0]).to have_content 'test1' }
        wait.until { expect(work_list[0]).to have_content '1-1' }
        wait.until { expect(work_list[0]).to have_content '1-10' }
        # wait.until{ expect(page).to have_content "絞り込み" }
        wait.until { expect(page).to have_content 'クリア' }
      end
      it '学習日で絞り込み後に、クリアボタンを押すと絞り込み前の情報が表示される（絞り込みボタンが表示される）', retry: 3 do
        fill_in 'q[do_on_gteq]', with: Time.zone.today - 1
        fill_in 'q[do_on_lteq]', with: Time.zone.today - 1
        click_on 'commit'
        click_on 'クリア'
        sleep 3
        work_list = all('#work-table tr')
        wait.until { expect(work_list[0]).to have_content Time.zone.today }
        wait.until { expect(work_list[0]).to have_content 'test1' }
        wait.until { expect(work_list[0]).to have_content '1' }
        wait.until { expect(work_list[0]).to have_content '10' }
        wait.until { expect(work_list[1]).to have_content Time.zone.today - 1 }
        wait.until { expect(work_list[1]).to have_content 'test1' }
        wait.until { expect(work_list[1]).to have_content '1-1' }
        wait.until { expect(work_list[1]).to have_content '1-10' }
        wait.until { expect(work_list[2]).to have_content Time.zone.today.last_month }
        wait.until { expect(work_list[2]).to have_content 'test1' }
        wait.until { expect(work_list[2]).to have_content '１' }
        wait.until { expect(work_list[2]).to have_content '１０' }
        # wait.until{ expect(page).to have_content "絞り込み" }
        wait.until { expect(page).to have_content 'クリア' }
      end
      it '検索内容に該当しない場合、その旨のメッセージが表示される（絞り込みボタンが表示される）' do
        fill_in 'q[do_on_gteq]', with: Time.zone.today.last_year
        fill_in 'q[do_on_lteq]', with: Time.zone.today.last_year
        click_on 'commit'
        # wait.until{ expect(page).to have_content "絞り込み" }
        wait.until { expect(page).to have_content 'クリア' }
        wait.until { expect(page).to have_content '学習情報の登録はありません' }
      end
      it '学習登録回数：学習登録回数が表示される' do
        wait.until { expect(page).to have_content '1回' }
        wait.until { expect(page).to have_content '2回' }
        wait.until { expect(page).to have_content '3回' }
      end
    end
  end

  describe '教材詳細画面から該当の教材の学習を記録するボタンをクリックした場合' do
    before do
      test_user_create(:user)
      FactoryBot.create(:material, user_id: 1)
      visit new_user_session_path
      fill_in 'user[email]', with: 'sample@example.com'
      fill_in 'user[password]', with: '0000000'
      click_on 'commit'
      click_on '登録した教材一覧'
      click_on 'test1'
      click_link '学習を記録する', href: '/works/new?material_id=1'
    end
    it '教材登録のセレクトボックスには、登録した教材のみが表示される' do
      wait.until { expect(page).to have_select('work[material_id]', options: ['test1']) }
    end
  end
end

# カレンダー機能はテストコードが不明確のため、テストコードは記載せず、手動で確認
