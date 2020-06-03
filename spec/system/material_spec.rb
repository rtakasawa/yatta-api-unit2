require 'rails_helper'
require 'devise'

RSpec.describe '教材管理機能', type: :system do

  wait = Selenium::WebDriver::Wait.new(:timeout => 1000)

  describe '教材一覧画面' do
    # before do
    #   User.create(id: 1, name: "sample", email: "sample@example.com",
    #               password: "0000000",admin: false)
    #   Label.create(id: 1, title:"work")
    #   task_first = create(:task, user_id: 1)
    #   task_second = create(:second_task, user_id: 1)
    #   task_third = create(:third_task, user_id: 1)
    #   task_first.task_to_labels.create(id:1, label_id: 1)
    #   task_second.task_to_labels.create(id:2, label_id: 1)
    #   task_third.task_to_labels.create(id:3, label_id: 1)
    #   visit new_session_path
    #   fill_in "session[email]", with: "sample@example.com"
    #   fill_in "session[password]", with: "0000000"
    #   click_on "ログインする"
    # end
    context '複数の教材を登録した場合' do
      it '登録済みの教材が表示される' do
        # wait.until{ expect(page).to have_content "test_name1" }
        # wait.until{ expect(page).to have_content "test_name2" }
        # wait.until{ expect(page).to have_content "test_name3" }
      end
      it '教材が登録日順に並んでいる' do
        # task_list = all('tbody tr' )
        # wait.until{ expect(task_list[0]).to have_content "test_name3" }
        # wait.until{ expect(task_list[1]).to have_content "test_name2" }
        # wait.until{ expect(task_list[2]).to have_content "test_name1" }
      end
    end

    context '任意の教材を削除した場合' do
      it '削除した教材が表示されない' do
        # click_link "削除", href: "/tasks/1"
        # page.accept_confirm
        # wait.until{ expect(page).to have_no_content 'test_name1' }
      end
    end

    context "検索した場合" do
      it "教材名検索ができる" do
        # fill_in "search[task_name]", with: 'test_name1'
        # click_on "検索する"
        # wait.until{ expect(page).to have_content 'test_name1' }
      end
      it "カテゴリー検索ができる" do
        # select "未着手", from: "search[status]"
        # click_on "検索する"
        # wait.until{ expect(page).to have_content '未着手' }
      end
      it "ステータス検索ができる" do
        # select "未着手", from: "search[status]"
        # click_on "検索する"
        # wait.until{ expect(page).to have_content '未着手' }
      end
      it "タグ検索ができる" do
        # select "work", from: "search[label_id]"
        # click_on "検索する"
        # wait.until{ expect(page).to have_content 'work' }
      end
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

  describe '教材登録画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存される' do
        # User.create(id: 1, name: "sample", email: "sample@example.com",
        #             password: "0000000",admin: false)
        # Label.create(id: 1, title:"work")
        # Label.create(id: 2, title:"private")
        # Label.create(id: 3, title:"other")
        # create(:task, user_id: 1)
        # visit new_session_path
        # fill_in "session[email]", with: "sample@example.com"
        # fill_in "session[password]", with: "0000000"
        # click_on "ログインする"
        # click_on "タスク登録"
        # fill_in 'task[task_name]', with: "task_name"
        # fill_in 'task[description]', with: "description"
        # fill_in 'task[deadline]', with: Date.today
        # check 'task_label_ids_1'
        # check 'task_label_ids_2'
        # check 'task_label_ids_3'
        # click_button "登録する"
        # wait.until{ expect(page).to have_content "task_name" }
        # wait.until{ expect(page).to have_content "description" }
        # wait.until{ expect(page).to have_content Date.today }
        # wait.until{ expect(page).to have_content "work" }
        # wait.until{ expect(page).to have_content "private" }
        # wait.until{ expect(page).to have_content "other" }
      end
    end
  end

  describe '教材詳細画面' do
    before do
      # User.create(id: 1, name: "sample", email: "sample@example.com",
      #             password: "0000000",admin: false)
      # create(:task, user_id: 1)
      # visit new_session_path
      # fill_in "session[email]", with: "sample@example.com"
      # fill_in "session[password]", with: "0000000"
      # click_on "ログインする"
    end
    context '任意の教材詳細画面に遷移した場合' do
      it '該当教材の内容が表示されたページに遷移する（学習記録含む）' do
        # click_on 'test_name1'
        # wait.until{ expect(page).to have_content "test_name1" }
        # wait.until{ expect(page).to have_content "test_description1" }
        # wait.until{ expect(page).to have_content '1900-01-01' }
      end
    end
    context '任意の教材を削除した場合' do
      it '削除した教材が表示されない' do
        # click_link "削除", href: "/tasks/1"
        # page.accept_confirm
        # wait.until{ expect(page).to have_no_content 'test_name1' }
      end
    end
  end

  describe '教材編集画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存される' do
        # User.create(id: 1, name: "sample", email: "sample@example.com",
        #             password: "0000000",admin: false)
        # Label.create(id: 1, title:"work")
        # Label.create(id: 2, title:"private")
        # Label.create(id: 3, title:"other")
        # create(:task, user_id: 1)
        # visit new_session_path
        # fill_in "session[email]", with: "sample@example.com"
        # fill_in "session[password]", with: "0000000"
        # click_on "ログインする"
        # click_link href: "/tasks/1/edit"
        # fill_in 'task[task_name]', with: "task_name"
        # fill_in 'task[description]', with: "description"
        # fill_in 'task[deadline]', with: Date.today
        # check 'task_label_ids_1'
        # check 'task_label_ids_2'
        # check 'task_label_ids_3'
        # click_button "登録する"
        # wait.until{ expect(page).to have_content "task_name" }
        # wait.until{ expect(page).to have_content "description" }
        # wait.until{ expect(page).to have_content Date.today }
        # wait.until{ expect(page).to have_content "work" }
        # wait.until{ expect(page).to have_content "private" }
        # wait.until{ expect(page).to have_content "other" }
      end
    end
  end

  describe '教材検索画面' do
    context '必要項目を入力して、検索ボタンを押した場合' do
      it '該当する教材が表示される' do

      end
      it '該当する教材がない場合は、その旨が表示される' do

      end
      it '該当する教材を登録する場合は、登録画面に教材の情報が表示される' do

      end
    end
  end
end