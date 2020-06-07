require 'rails_helper'
require 'devise'

RSpec.describe '教材管理機能', type: :system do

  wait = Selenium::WebDriver::Wait.new(:timeout => 1000)

  describe '教材登録画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存される' do
        User.create(id: 1, name: "sample", email: "sample@example.com", password: "0000000")
        visit new_user_session_path
        fill_in "user[email]", with: "sample@example.com"
        fill_in "user[password]", with: "0000000"
        click_on "ログイン"
        click_on "教材投稿"
        fill_in 'material[title]', with: "test1"
        fill_in 'material[author]', with: "test_author1"
        select "book", from: 'material[category]'
        fill_in "material[tag_list]", with: 'test_tag1,test_tag2'
        fill_in 'material[path]', with: "http://example.com"
        fill_in 'material[note]', with: "test_note1"
        click_button "登録する"
        wait.until{ expect(page).to have_link "test1" }
        wait.until{ expect(page).to have_content "test_author1" }
        wait.until{ expect(page).to have_content "book" }
        wait.until{ expect(page).to have_content "test_tag1" }
        wait.until{ expect(page).to have_content "test_tag2" }
        wait.until{ expect(page).to have_content "test_note1" }
      end
    end
  end

  describe '教材一覧画面' do
    before do
      User.create(id: 1, name: "sample", email: "sample@example.com", password: "0000000")
      material_first = FactoryBot.create(:material, user_id: 1)
      material_second = FactoryBot.create(:second_material, user_id: 1)
      material_third = FactoryBot.create(:third_material, user_id: 1)
      material_first.tags.create(name:"test_tag1")
      material_second.tags.create(name:"test_tag2")
      material_third.tags.create(name:"test_tag3")
      visit new_user_session_path
      fill_in "user[email]", with: "sample@example.com"
      fill_in "user[password]", with: "0000000"
      click_on "ログイン"
    end

    context '複数の教材を登録した場合' do
      it '登録済みの教材が表示される' do
        wait.until{ expect(page).to have_content "test1" }
        wait.until{ expect(page).to have_content "test2" }
        wait.until{ expect(page).to have_content "test3" }
      end
      # 未対応
      it '教材が新しく登録した順に並んでいる' do
        # task_list = all('tbody tr' )
        # wait.until{ expect(task_list[0]).to have_content "test_name3" }
        # wait.until{ expect(task_list[1]).to have_content "test_name2" }
        # wait.until{ expect(task_list[2]).to have_content "test_name1" }
      end
      # 未対応
      it '最新の学習情報が表示されている（学習情報の登録がある場合）' do
        # task_list = all('tbody tr' )
        # wait.until{ expect(task_list[0]).to have_content "test_name3" }
        # wait.until{ expect(task_list[1]).to have_content "test_name2" }
        # wait.until{ expect(task_list[2]).to have_content "test_name1" }
      end
    end

    context '任意の教材を削除した場合' do
      it '削除した教材が表示されない' do
        click_link "削除", href: "/materials/1"
        page.accept_confirm
        wait.until{ expect(page).to have_no_content 'test1' }
      end
    end

    context "登録した教材の検索" do
      it "教材名検索ができる" do
        fill_in "q[title_or_tags_name_cont]", with: 'test1'
        click_on "commit"
        wait.until{ expect(page).to have_content 'test1' }
      end
      it "タグ名検索ができる" do
        fill_in "q[title_or_tags_name_cont]", with: 'test_tag1'
        click_on "commit"
        wait.until{ expect(page).to have_content 'test_tag1' }
      end
      it "カテゴリー検索ができる" do
        select "動画", from: "q[category_eq]"
        click_on "commit"
        wait.until{ expect(page).to have_content 'video' }
      end
      # 未対応
      it "ステータス検索ができる" do
        # select "未着手", from: "search[status]"
        # click_on "検索する"
        # wait.until{ expect(page).to have_content '未着手' }
      end
      # 未対応
      it "教材名、カテゴリー、ステータス、タグを指定して、検索ができる" do
        # fill_in "search[task_name]", with: 'test_name1'
        # select "未着手", from: "search[status]"
        # select "work", from: "search[label_id]"
        # click_on "検索する"
        # wait.until{ expect(page).to have_content 'test_name1' }
        # wait.until{ expect(page).to have_content '未着手' }
        # wait.until{ expect(page).to have_content 'work' }
      end
    end
    # 未対応
    context "ソートした場合" do
      it "学習日のソートボタンをクリックすると学習日が新しい順に並び替えることができる" do
        # click_on "終了期限でソートする"
        # sleep(0.5) # エラー回避のため
        # task_list = all('tbody tr' )
        # wait.until{ expect(task_list[0]).to have_content '1900-01-01' }
        # wait.until{ expect(task_list[1]).to have_content '2000-01-01' }
        # wait.until{ expect(task_list[2]).to have_content '2100-01-01' }
      end
    end
  end

  describe '教材詳細画面' do
    before do
      User.create(id: 1, name: "sample", email: "sample@example.com", password: "0000000")
      FactoryBot.create(:material, user_id: 1)
      visit new_user_session_path
      fill_in "user[email]", with: "sample@example.com"
      fill_in "user[password]", with: "0000000"
      click_on "ログイン"
    end
    context '任意の教材詳細画面に遷移した場合' do
      it '該当教材の内容が表示されたページに遷移する' do
        click_on 'test1'
        wait.until{ expect(page).to have_link "test1" }
        wait.until{ expect(page).to have_content "test_author1" }
        wait.until{ expect(page).to have_content "book" }
        wait.until{ expect(page).to have_content "test_note1" }
      end
      # 未対応
      # 学習記録が含まれていない
      it '学習記録は最新の登録順に表示されている' do
      end
    end
    context '任意の教材を削除した場合' do
      it '削除した教材が表示されない' do
        click_link "削除", href: "/materials/1"
        page.accept_confirm
        wait.until{ expect(page).to have_no_content 'test1' }
      end
    end
  end

  describe '教材編集画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存される' do
        User.create(id: 1, name: "sample", email: "sample@example.com", password: "0000000")
        material_first = FactoryBot.create(:material, user_id: 1)
        material_first.tags.create(name:"test_tag1")
        visit new_user_session_path
        fill_in "user[email]", with: "sample@example.com"
        fill_in "user[password]", with: "0000000"
        click_on "ログイン"
        click_link href: "/materials/1/edit"
        fill_in 'material[title]', with: "test2"
        fill_in 'material[author]', with: "test_author2"
        select "video", from: 'material[category]'
        fill_in 'material[path]', with: "http://example2.com"
        fill_in "material[tag_list]", with: 'test_tag99,test_tag100'
        fill_in 'material[note]', with: "test_note2"
        click_button "登録する"
        wait.until{ expect(page).to have_link "test2" }
        wait.until{ expect(page).to have_content "test_author2" }
        wait.until{ expect(page).to have_content "video" }
        wait.until{ expect(page).to have_content 'test_tag99' }
        wait.until{ expect(page).to have_content 'test_tag100' }
        wait.until{ expect(page).to have_content "test_note2" }
      end
    end
  end

  # エラー出るため保留
  # describe '登録する教材を検索する場合' do
  #   before do
  #     User.create(id: 1, name: "sample", email: "sample@example.com", password: "0000000")
  #     FactoryBot.create(:material, user_id: 1)
  #     visit new_user_session_path
  #     fill_in "user[email]", with: "sample@example.com"
  #     fill_in "user[password]", with: "0000000"
  #     click_on "ログイン"
  #   end
  #   context '必要項目を入力して、検索ボタンを押した場合' do
  #     it '該当する教材が表示される' do
  #       fill_in "keyword", with: "ruby"
  #       click_on "検索"
  #       wait.until{ expect(page).to have_content "プロを目指す人のためのRuby入門" }
  #     end
  #     it '該当する教材がない場合は、その旨が表示される' do
  #
  #     end
  #     it '該当する教材を登録する場合は、登録画面に教材の情報が表示される' do
  #
  #     end
  #   end
  # end
end