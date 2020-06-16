require 'rails_helper'
require 'devise'

RSpec.describe  "ユーザー登録・ログイン・ログアウト機能", type: :system do

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
      it "自分の情報の編集をすることができる（パスワード変更なし）" do
        click_on "会員情報"
        click_on "会員編集・退会"
        fill_in "user[name]", with: "sample1"
        fill_in "user[email]", with: "sample1@example.com"
        fill_in "user[current_password]", with: '0000000'
        click_on "更新"
        expect(current_path).to eq user_path(id: 1)
        expect(page).to have_content "sample1"
      end
      it "自分の情報の編集する際に現在のパスワードを誤ると編集できない" do
        click_on "会員情報"
        click_on "会員編集・退会"
        fill_in "user[name]", with: "sample1"
        fill_in "user[email]", with: "sample1@example.com"
        fill_in "user[current_password]", with: '1234567'
        click_on "更新"
        expect(page).to have_content "現在のパスワードを入力してください"
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