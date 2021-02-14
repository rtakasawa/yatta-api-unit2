require 'rails_helper'

RSpec.describe '教材管理機能', js: true, type: :system do
  wait = Selenium::WebDriver::Wait.new(timeout: 1000)

  describe '教材登録画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存される' do
        test_user_create(:user)
        visit new_user_session_path
        fill_in 'user[email]', with: 'sample@example.com'
        fill_in 'user[password]', with: '0000000'
        click_on 'commit'
        click_on '教材を登録する'
        fill_in 'material[title]', with: 'test1'
        select '書籍', from: 'material[category]'
        fill_in 'material[path]', with: 'http://example.com'
        fill_in 'material[tag_list]', with: 'test_tag1,test_tag2'
        fill_in 'material[note]', with: 'test_note1'
        click_button '登録'
        wait.until { expect(page).to have_link 'test1' }
        wait.until { expect(page).to have_content '書籍' }
        wait.until { expect(page).to have_content 'test_tag1' }
        wait.until { expect(page).to have_content 'test_tag2' }
        wait.until { expect(page).to have_content 'test_note1' }
        wait.until { expect(page).to have_content '学習中' }
      end
    end
  end

  describe '教材一覧画面' do
    before do
      test_user_create(:user)
    end

    context '教材を登録していない場合' do
      it '教材の登録がないとメッセージが表示されている' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'sample@example.com'
        fill_in 'user[password]', with: '0000000'
        click_on 'commit'
        click_on '登録した教材一覧'
        wait.until { expect(page).to have_content '教材の登録はありません' }
      end
      it '教材の登録がないと絞り込みボタンが表示されない' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'sample@example.com'
        fill_in 'user[password]', with: '0000000'
        click_on 'commit'
        click_on '登録した教材一覧'
        wait.until { expect(page).to have_no_content '絞り込み' }
      end
    end

    context '複数の教材を登録した場合' do
      before do
        material_first = FactoryBot.create(:material, user_id: 1)
        material_second = FactoryBot.create(:second_material, user_id: 1)
        material_third = FactoryBot.create(:third_material, user_id: 1)
        material_first.tags.create(name: 'test_tag1-1')
        material_first.tags.create(name: 'test_tag1-2')
        material_second.tags.create(name: 'test_tag2')
        material_third.tags.create(name: 'test_tag3')
        FactoryBot.create(:work, material_id: 1)
        FactoryBot.create(:second_work, material_id: 1)
        FactoryBot.create(:third_work, material_id: 1)
        FactoryBot.create(:second_user)
        FactoryBot.create(:fourth_material, title: 'other_user_material', user_id: 2)
        FactoryBot.create(:fourth_work, start: 'other_start', material_id: 4)
        visit new_user_session_path
        fill_in 'user[email]', with: 'sample@example.com'
        fill_in 'user[password]', with: '0000000'
        click_on 'commit'
        click_on '登録した教材一覧'
      end
      it '登録済みの教材、タグが表示される（表示順：①status②updated_at※work編集の際もmaterialのupdated_at更新）' do
        material_list = all('tbody tr')
        wait.until { expect(material_list[0]).to have_content 'test1' }
        wait.until { expect(material_list[0]).to have_content '書籍' }
        wait.until { expect(material_list[0]).to have_content '学習中' }
        wait.until { expect(material_list[0]).to have_content 'test_tag1-1' }
        wait.until { expect(material_list[0]).to have_content 'test_tag1-2' }
        wait.until { expect(material_list[1]).to have_content 'test3' }
        wait.until { expect(material_list[1]).to have_content 'WEB記事' }
        wait.until { expect(material_list[1]).to have_content '学習中' }
        wait.until { expect(material_list[1]).to have_content 'test_tag3' }
        wait.until { expect(material_list[2]).to have_content 'test2' }
        wait.until { expect(material_list[2]).to have_content '動画' }
        wait.until { expect(material_list[2]).to have_content '完了' }
        wait.until { expect(material_list[2]).to have_content 'test_tag2' }
      end
      it '最新の学習情報が表示されている（学習情報の登録がある場合）' do
        material_list = all('tbody tr')
        wait.until { expect(material_list[0]).to have_content '1' }
        wait.until { expect(material_list[0]).to have_content '10' }
        wait.until { expect(material_list[0]).to have_content Time.zone.today }
      end
      it '自分の教材のみ表示される（他人の教材は表示されない）' do
        wait.until { expect(page).to have_no_content 'other_user_material' }
      end
      it '教材名検索ができる（絞り込みボタンが表示される）' do
        click_link '絞り込み', href: '#collapseExample'
        fill_in 'q[title_or_tags_name_cont]', with: 'test1'
        click_on 'commit'
        wait.until { expect(page).to have_content 'test1' }
        wait.until { expect(page).to have_content '絞り込み' }
      end
      it 'タグ名検索ができる（絞り込みボタンが表示される）' do
        click_link '絞り込み', href: '#collapseExample'
        fill_in 'q[title_or_tags_name_cont]', with: 'test_tag1-1'
        click_on 'commit'
        wait.until { expect(page).to have_content 'test_tag1-1' }
        wait.until { expect(page).to have_content '絞り込み' }
      end
      it 'カテゴリー検索ができる（絞り込みボタンが表示される）' do
        click_link '絞り込み', href: '#collapseExample'
        select '動画', from: 'q[category_eq]'
        click_on 'commit'
        wait.until { expect(page).to have_content '動画' }
        wait.until { expect(page).to have_content '絞り込み' }
      end
      it 'ステータス検索ができる（絞り込みボタンが表示される）' do
        click_link '絞り込み', href: '#collapseExample'
        select '完了', from: 'q[status_eq]'
        click_on 'commit'
        wait.until { expect(page).to have_content '完了' }
        wait.until { expect(page).to have_content '絞り込み' }
      end
      it '教材名、カテゴリー、ステータスを指定して、検索ができる（絞り込みボタンが表示される）' do
        click_link '絞り込み', href: '#collapseExample'
        fill_in 'q[title_or_tags_name_cont]', with: 'test1'
        select '書籍', from: 'q[category_eq]'
        select '学習中', from: 'q[status_eq]'
        click_on 'commit'
        wait.until { expect(page).to have_content 'test1' }
        wait.until { expect(page).to have_content '書籍' }
        wait.until { expect(page).to have_content '学習中' }
        wait.until { expect(page).to have_content '絞り込み' }
      end
      it '教材名検索後に、クリアボタンを押すと検索前の情報が表示される', retry: 3 do
        click_link '絞り込み', href: '#collapseExample'
        fill_in 'q[title_or_tags_name_cont]', with: 'test1'
        select '書籍', from: 'q[category_eq]'
        select '学習中', from: 'q[status_eq]'
        click_on 'commit'
        click_link '絞り込み', href: '#collapseExample'
        click_on 'クリア'
        sleep 0.5
        material_list = all('tbody tr')
        wait.until { expect(material_list[0]).to have_content 'test1' }
        wait.until { expect(material_list[0]).to have_content '書籍' }
        wait.until { expect(material_list[0]).to have_content '学習中' }
        wait.until { expect(material_list[0]).to have_content 'test_tag1-1' }
        wait.until { expect(material_list[0]).to have_content 'test_tag1-2' }
        wait.until { expect(material_list[1]).to have_content 'test3' }
        wait.until { expect(material_list[1]).to have_content 'WEB記事' }
        wait.until { expect(material_list[1]).to have_content '学習中' }
        wait.until { expect(material_list[1]).to have_content 'test_tag3' }
        wait.until { expect(material_list[2]).to have_content 'test2' }
        wait.until { expect(material_list[2]).to have_content '動画' }
        wait.until { expect(material_list[2]).to have_content '完了' }
        wait.until { expect(material_list[2]).to have_content 'test_tag2' }
        wait.until { expect(page).to have_content '絞り込み' }
      end
      it '検索内容に該当しない場合、その旨のメッセージが表示される（絞り込みボタンが表示される）' do
        click_link '絞り込み', href: '#collapseExample'
        fill_in 'q[title_or_tags_name_cont]', with: '------------------'
        click_on 'commit'
        wait.until { expect(page).to have_content '教材の登録はありません' }
        wait.until { expect(page).to have_content '絞り込み' }
      end
    end
  end

  describe '教材詳細画面' do
    before do
      test_user_create(:user)
      material_first = FactoryBot.create(:material, user_id: 1)
      material_first.tags.create(name: 'test_tag1-1')
      material_first.tags.create(name: 'test_tag1-2')
      FactoryBot.create(:work, material_id: 1)
      FactoryBot.create(:second_work, material_id: 1)
      FactoryBot.create(:third_work, material_id: 1)
      visit new_user_session_path
      fill_in 'user[email]', with: 'sample@example.com'
      fill_in 'user[password]', with: '0000000'
      click_on 'commit'
      click_on '登録した教材一覧'
      click_on 'test1'
    end
    context '任意の教材詳細画面に遷移した場合' do
      it '該当教材の内容が表示されたページに遷移する' do
        wait.until { expect(page).to have_link 'test1' }
        wait.until { expect(page).to have_content '書籍' }
        wait.until { expect(page).to have_content 'test_note1' }
        wait.until { expect(page).to have_content 'test_tag1-1' }
        wait.until { expect(page).to have_content 'test_tag1-2' }
        wait.until { expect(page).to have_content '学習中' }
      end
      it '学習記録は最新の登録順に表示されている' do
        work_list = all('#work-list tr')
        wait.until { expect(work_list[0]).to have_content '1' }
        wait.until { expect(work_list[0]).to have_content '10' }
        wait.until { expect(work_list[0]).to have_content Time.zone.today }
        wait.until { expect(work_list[1]).to have_content '1-1' }
        wait.until { expect(work_list[1]).to have_content '1-10' }
        wait.until { expect(work_list[1]).to have_content Time.zone.today - 1 }
        wait.until { expect(work_list[2]).to have_content '１' }
        wait.until { expect(work_list[2]).to have_content '１００' }
        wait.until { expect(work_list[2]).to have_content Time.zone.today - 2 }
      end
      context '任意の教材詳細画面に遷移し、「学習完了にする」をクリックした場合' do
        before do
          click_on '学習完了にする'
        end
        it 'materialと紐づくworkのstatusが学習完了になる' do
          material = Material.find(1)
          wait.until { expect(page).to have_content '完了' }
          wait.until { expect(material.status).to eq 'complete' }
          wait.until { expect(material.works[0].status).to eq 'complete' }
          wait.until { expect(material.works[1].status).to eq 'complete' }
          wait.until { expect(material.works[2].status).to eq 'complete' }
        end
        it '「学習を記録する」「学習を完了する」「編集」ボタンは表示されず、「学習状況を学習中に戻す」ボタンが表示される' do
          wait.until { expect(page).to have_no_link '学習を記録する', href: "/works/new?material_id=1" }
          wait.until { expect(page).not_to have_content '学習完了にする' }
          wait.until { expect(page).not_to have_content '編集' }
          wait.until { expect(page).to have_content '学習状況を学習中に戻す' }
        end
        it '「学習状況を学習中に戻す」ボタンをクリックした場合、materialと紐づくworkのstatusが学習中になる' do
          click_on '学習状況を学習中に戻す'
          material = Material.find(1)
          wait.until { expect(page).to have_content '学習中' }
          wait.until { expect(material.status).to eq 'learning' }
          wait.until { expect(material.works[0].status).to eq 'learning' }
          wait.until { expect(material.works[1].status).to eq 'learning' }
          wait.until { expect(material.works[2].status).to eq 'learning' }
        end
        it '「学習状況を学習中に戻す」ボタンをクリックした場合、「学習を記録する」「学習を完了する」「編集」ボタンが表示され、「学習状況を学習中に戻す」ボタンが表示されない' do
          click_on '学習状況を学習中に戻す'
          wait.until { expect(page).to have_link '学習を記録する', href: "/works/new?material_id=1" }
          wait.until { expect(page).to have_content '学習完了にする' }
          wait.until { expect(page).to have_content '編集' }
          wait.until { expect(page).not_to have_content '学習状況を学習中に戻す' }
        end
      end
    end
    context '任意の教材を削除した場合' do
      it '削除した教材が表示されない' do
        click_link '削除'
        page.accept_confirm
        wait.until { expect(page).to have_no_content 'test1' }
      end
    end
  end

  describe '教材編集画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存される' do
        test_user_create(:user)
        material_first = FactoryBot.create(:material, user_id: 1)
        material_first.tags.create(name: 'test_tag1')
        visit new_user_session_path
        fill_in 'user[email]', with: 'sample@example.com'
        fill_in 'user[password]', with: '0000000'
        click_on 'commit'
        click_on '登録した教材一覧'
        click_on 'test1'
        click_on '編集'
        fill_in 'material[title]', with: 'test2'
        select '動画', from: 'material[category]'
        fill_in 'material[path]', with: 'http://example2.com'
        fill_in 'material[tag_list]', with: 'test_tag99,test_tag100'
        fill_in 'material[note]', with: 'test_note2'
        click_button '登録'
        wait.until { expect(page).to have_link 'test2' }
        wait.until { expect(page).to have_content '動画' }
        wait.until { expect(page).to have_content '完了' }
        wait.until { expect(page).to have_content 'test_tag99' }
        wait.until { expect(page).to have_content 'test_tag100' }
        wait.until { expect(page).to have_content 'test_note2' }
      end
    end
  end

  describe 'Qiitaの記事を検索する場合' do
    before do
      test_user_create(:user)
      FactoryBot.create(:material, user_id: 1)
      visit new_user_session_path
      fill_in 'user[email]', with: 'sample@example.com'
      fill_in 'user[password]', with: '0000000'
      click_on 'commit'
    end
    context 'キーワードを入力して、検索ボタンを押した場合' do
      it '該当する記事があれば、記事が表示される' do
        select 'Qiita', from: 'search_id'
        fill_in 'search_keyword', with: 'Markdown記法 チートシート'
        click_on '検索'
        wait.until { expect(page).to have_content 'Markdown記法 チートシート' }
      end
      it '該当する記事がなければ、適切なメッセージが表示される' do
        select 'Qiita', from: 'search_id'
        fill_in 'search_keyword', with: '---------------------------'
        click_on '検索'
        wait.until { expect(page).to have_content '検索にヒットした記事がありませんでした' }
      end
    end
    context 'キーワードを入力せずに、検索ボタンを押した場合' do
      it '適切なメッセージが表示される' do
        select 'Qiita', from: 'search_id'
        fill_in 'search_keyword', with: ''
        click_on '検索'
        wait.until { expect(page).to have_content '検索キーワードを入力してください' }
      end
    end
    context '該当する記事が表示された場合' do
      it '登録ボタンを押すと、教材登録ができる' do
        select 'Qiita', from: 'search_id'
        fill_in 'search_keyword', with: 'Markdown記法 チートシート'
        click_on '検索'
        find('#contents > div:nth-child(1) > div.mt-1 > table > tbody > tr:nth-child(1) > td:nth-child(3) > a').click
        click_on '登録'
        wait.until { expect(page).to have_content '教材が登録されました' }
      end
    end
  end

  describe '書籍を検索する場合' do
    before do
      test_user_create(:user)
      FactoryBot.create(:material, user_id: 1)
      visit new_user_session_path
      fill_in 'user[email]', with: 'sample@example.com'
      fill_in 'user[password]', with: '0000000'
      click_on 'commit'
      select '書籍', from: 'search_id'
    end
    context 'キーワードを入力して、検索ボタンを押した場合' do
      it '該当する書籍があれば、書籍が表示される' do
        fill_in 'search_keyword', with: 'プロを目指す人のためのRuby入門'
        click_on '検索'
        wait.until { expect(page).to have_content 'プロを目指す人のためのRuby入門' }
      end
      it '該当する書籍がなければ、適切なメッセージが表示される' do
        fill_in 'search_keyword', with: '---------------------------'
        click_on '検索'
        wait.until { expect(page).to have_content '検索にヒットするものがありませんでした' }
      end
    end
    context 'キーワードを入力せずに、検索ボタンを押した場合' do
      it '適切なメッセージが表示される' do
        fill_in 'search_keyword', with: ''
        click_on '検索'
        wait.until { expect(page).to have_content '検索キーワードを入力してください' }
      end
    end
    context 'キーワードを1文字入力し、検索ボタンを押した場合' do
      it '適切なメッセージが表示される' do
        fill_in 'search_keyword', with: '1'
        click_on '検索'
        wait.until { expect(page).to have_content '検索キーワードは２文字以上入力してください' }
      end
    end
    context '該当する書籍が表示された場合' do
      it '登録ボタンを押すと、教材登録ができる', retry: 3 do
        fill_in 'search_keyword', with: 'プロを目指す人のためのRuby入門'
        click_on '検索'
        sleep 3
        click_on '登録'
        click_on '登録'
        wait.until { expect(page).to have_content '教材が登録されました' }
      end
    end
  end

  describe 'Udemy講座を検索する場合' do
    before do
      test_user_create(:user)
      FactoryBot.create(:material, user_id: 1)
      visit new_user_session_path
      fill_in 'user[email]', with: 'sample@example.com'
      fill_in 'user[password]', with: '0000000'
      click_on 'commit'
      select 'Udemy', from: 'search_id'
    end
    context 'キーワードを入力して、検索ボタンを押した場合' do
      it 'キーワードに該当する講座が表示される' do
        fill_in 'search_keyword', with: 'Rails'
        click_on '検索'
        wait.until { expect(page).to have_content 'Rails' }
      end
      it '該当する書籍がなければ、適切なメッセージが表示される' do
        fill_in 'search_keyword', with: '---------------------------？？？？？？？？？？？？？？'
        click_on '検索'
        wait.until { expect(page).to have_content '検索にヒットする講座はありませんでした' }
      end
    end
    context 'キーワードを入力せずに、検索ボタンを押した場合' do
      it '適切なメッセージが表示される' do
        fill_in 'search_keyword', with: ''
        click_on '検索'
        wait.until { expect(page).to have_content '検索キーワードを入力してください' }
      end
    end
    context '該当する書籍が表示された場合' do
      it '登録ボタンを押すと、教材登録ができる', retry: 3 do
        fill_in 'search_keyword', with: 'Rails'
        click_on '検索'
        sleep 3
        find("#contents > div:nth-child(1) > div:nth-child(3) > div:nth-child(1) > div > div.col-md-8 > div > p > a").click
        click_on '登録'
        wait.until { expect(page).to have_content '教材が登録されました' }
      end
    end
  end
end
