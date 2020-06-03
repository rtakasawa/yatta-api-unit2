require 'rails_helper'
require 'devise'

RSpec.describe  "ユーザー登録・ログイン・ログアウト機能", type: :system do

  wait = Selenium::WebDriver::Wait.new(:timeout => 100)

  describe "ユーザー登録のテスト" do
    context "ユーザーのデータがなくログインしていない場合" do
      #実装はできている。とりあえず"Materials#index"と指定
      it "アカウントを登録すると教材一覧画面に飛ぶ" do
        visit new_user_registration_path
        fill_in "user[name]", with: "sample"
        fill_in "user[email]", with: "sample@example.com"
        fill_in "user[password]", with: '0000000'
        fill_in "user[password_confirmation]", with: '0000000'
        click_on "アカウント登録"
        expect(page).to have_content "Materials#index"
      end
      it "ログインせずに教材一覧画面に行くと、ログイン画面に飛ぶ" do
        visit materials_path
        expect(current_path).to eq new_user_session_path
      end
      it "ログインせずに会員詳細画面に行くと、ログイン画面に遷移すること" do
        visit user_path(id: 1)
        expect(current_path).to eq new_user_session_path
      end
      it "ログインせずに会員編集・退会画面に行くと、ログイン画面に遷移すること" do
        visit edit_user_registration_path
        expect(current_path).to eq new_user_session_path
      end
    end
  end

  describe "セッション機能のテスト" do
    context "ユーザーを登録している場合" do
      before do
        FactoryBot.create(:user)
        FactoryBot.create(:admin_user)
        visit new_user_session_path
        fill_in "user[email]", with: "sample@example.com"
        fill_in "user[password]", with: "0000000"
        click_on "ログイン"
      end
      it "ログインできること" do
        expect(current_path).to eq root_path
      end
      it "ログアウトができること" do
        click_on "ログアウト"
        expect(current_path).to eq new_user_session_path
      end
      it "自分の詳細画面(マイページ)に飛べること" do
        click_on "会員情報"
        expect(current_path).to eq user_path(id: 1)
      end
      it "自分の情報の編集・退会画面に飛べること" do
        click_on "会員情報"
        click_on "会員編集・退会"
        expect(current_path).to eq edit_user_registration_path(1)
      end
      it "自分の情報を編集できること" do
        click_on "会員情報"
        click_on "会員編集・退会"
        fill_in "user[name]", with: "sample1"
        fill_in "user[email]", with: "sample1@example.com"
        fill_in "user[password]", with: '1111111'
        fill_in "user[password_confirmation]", with: '1111111'
        fill_in "user[current_password]", with: '0000000'
        click_on "更新"
        expect(current_path).to eq user_path(id: 1)
        expect(page).to have_content "sample1"
      end
      it "退会できること" do
        click_on "会員情報"
        click_on "会員編集・退会"
        click_on "アカウント削除"
        page.accept_confirm
        expect(current_path).to eq new_user_session_path
        expect(User.count).to eq 1
      end
      it "他人の会員詳細画面にアクセスすると教材一覧ページに遷移すること" do
        visit user_path(id: 2)
        expect(current_path).to eq materials_path
      end
      it "他人の会員編集・退会画面にアクセスすると自分の会員編集・退会画面に遷移すること" do
        visit edit_user_registration_path(2)
        expect(page).to have_field "user[name]", with: "sample"
      end
    end
  end
end

#   describe "管理画面のテスト" do
#     context "管理者登録をしている場合" do
#       before do
#         create(:user)
#         create(:admin_user)
#         create(:second_admin_user)
#         visit new_session_path
#       end
#       it "管理者は管理画面にアクセスできること" do
#         fill_in "session[email]", with: "admine@example.com"
#         fill_in "session[password]", with: "0000000"
#         click_on "ログインする"
#         click_on "管理者ページ"
#         expect(current_path).to eq admin_users_path
#       end
#       it "一般ユーザは管理画面にアクセスできないこと" do
#         fill_in "session[email]", with: "sample@example.com"
#         fill_in "session[password]", with: "0000000"
#         click_on "ログインする"
#         visit admin_users_path
#         expect(current_path).to eq tasks_path
#       end
#       it "管理者はユーザを新規登録できること" do
#         fill_in "session[email]", with: "admine@example.com"
#         fill_in "session[password]", with: "0000000"
#         click_on "ログインする"
#         click_on "管理者ページ"
#         click_on "ユーザー登録"
#         fill_in "user[name]", with: "admin2"
#         fill_in "user[email]", with: "admin2@example.com"
#         check "user[admin]"
#         fill_in "user[password]", with: '0000000'
#         fill_in "user[password_confirmation]", with: '0000000'
#         click_on "登録する"
#         expect(page).to have_content "admin2"
#       end
#       it "管理者はユーザの詳細画面にアクセスできること" do
#         fill_in "session[email]", with: "admine@example.com"
#         fill_in "session[password]", with: "0000000"
#         click_on "ログインする"
#         click_on "管理者ページ"
#         click_on "sample"
#         expect(current_path).to eq admin_user_path(id: 1)
#       end
#       it "管理者はユーザの編集画面からユーザを編集できること" do
#         fill_in "session[email]", with: "admine@example.com"
#         fill_in "session[password]", with: "0000000"
#         click_on "ログインする"
#         click_on "管理者ページ"
#         click_link href: "/admin/users/1/edit"
#         fill_in "user[name]", with: "admin2"
#         fill_in "user[email]", with: "admin2@example.com"
#         check "user[admin]"
#         fill_in "user[password]", with: '0000000'
#         fill_in "user[password_confirmation]", with: '0000000'
#         click_on "登録する"
#         expect(page).to have_content "admin2"
#       end
#       it "管理者はユーザの削除をできること" do
#         fill_in "session[email]", with: "admine@example.com"
#         fill_in "session[password]", with: "0000000"
#         click_on "ログインする"
#         click_on "管理者ページ"
#         click_link "ユーザー削除", href: "/admin/users/1"
#         page.accept_confirm
#         expect(page).to have_no_content "sample"
#       end
#     end
#   end
# end