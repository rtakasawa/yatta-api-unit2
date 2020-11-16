require 'rails_helper'

RSpec.describe 'ユーザー登録、ログイン・ログアウト機能、管理者機能', js: true, type: :system do
  describe 'ユーザー登録のテスト' do
    context 'アカウント登録画面' do
      it 'ユーザーの新規登録後、ログインできること' do
        visit new_user_registration_path
        fill_in 'user[name]', with: 'sample'
        fill_in 'user[email]', with: 'sample@example.com'
        fill_in 'user[password]', with: '0000000'
        fill_in 'user[password_confirmation]', with: '0000000'
        # メールアドレス確認メールが送信されているか確認する
        expect { click_on 'commit' }.to change { ActionMailer::Base.deliveries.size }.by(1)
        expect(page).to have_content '本人確認用のメールを送信しました。メール内のリンクからアカウントを有効化させてください。'

        # 以下は確認メールのテスト
        user = User.last
        # 変数にuser.confirmation_tokenを代入
        token = user.confirmation_token
        # 本来はメール本文に貼ってある確認用のリンクにvisitしてメールアドレスの確認をするが
        # confirmation_tokenに変数tokenをセットすることによってメール認証をしたことにできる
        visit user_confirmation_path(confirmation_token: token)
        expect(page).to have_content 'メールアドレスが確認できました。'

        # ログインできることの確認
        fill_in 'user[email]', with: 'sample@example.com'
        fill_in 'user[password]', with: '0000000'
        click_on 'commit'
        expect(current_path).to eq root_path
      end
      it 'ログインせずに教材一覧画面に行くと、ログイン画面に飛ぶ' do
        visit materials_path
        expect(current_path).to eq new_user_session_path
      end
      it 'ログインせずに会員詳細画面に行くと、ログイン画面に遷移すること' do
        visit user_path(id: 1)
        expect(current_path).to eq new_user_session_path
      end
      it 'ログインせずに会員編集・退会画面に行くと、ログイン画面に遷移すること' do
        visit edit_user_registration_path
        expect(current_path).to eq new_user_session_path
      end
    end
  end

  describe 'セッション機能のテスト' do
    context 'ユーザーを登録している場合' do
      before do
        test_user_create(:user)
        test_user_create(:second_user)
        visit new_user_session_path
        fill_in 'user[email]', with: 'sample@example.com'
        fill_in 'user[password]', with: '0000000'
        click_on 'commit'
      end
      it 'ログインできること' do
        expect(current_path).to eq root_path
      end
      it 'ログアウトができること' do
        click_on 'ログアウト'
        expect(current_path).to eq root_path
        expect(page).to have_content 'ログアウトしました。'
      end
      it '自分の詳細画面(マイページ)に飛べること' do
        click_on '会員情報'
        expect(current_path).to eq user_path(id: 1)
      end
      it '自分の情報の編集・アカウント削除画面に飛べること' do
        click_on '会員情報'
        click_on '会員情報：編集・アカウント削除'
        expect(current_path).to eq edit_user_registration_path(1)
      end
      it '自分の情報を編集できること' do
        click_on '会員情報'
        click_on '会員情報：編集・アカウント削除'
        fill_in 'user[name]', with: 'sample1'
        fill_in 'user[email]', with: 'sample1@example.com'
        fill_in 'user[password]', with: '1111111'
        fill_in 'user[password_confirmation]', with: '1111111'
        fill_in 'user[current_password]', with: '0000000'
        click_on '更新'
        expect(current_path).to eq user_path(id: 1)
        expect(page).to have_content 'sample1'
      end
      it '自分の情報の編集をすることができる（パスワード変更なし）' do
        click_on '会員情報'
        click_on '会員情報：編集・アカウント削除'
        fill_in 'user[name]', with: 'sample1'
        fill_in 'user[email]', with: 'sample1@example.com'
        fill_in 'user[current_password]', with: '0000000'
        click_on '更新'
        expect(current_path).to eq user_path(id: 1)
        expect(page).to have_content 'sample1'
      end
      it '自分の情報の編集する際に現在のパスワードを誤ると編集できない' do
        click_on '会員情報'
        click_on '会員情報：編集・アカウント削除'
        fill_in 'user[name]', with: 'sample1'
        fill_in 'user[email]', with: 'sample1@example.com'
        fill_in 'user[current_password]', with: '1234567'
        click_on '更新'
        expect(page).to have_content '現在のパスワードを入力してください'
      end
      it 'アカウント削除できること' do
        click_on '会員情報'
        click_on '会員情報：編集・アカウント削除'
        click_on 'アカウント削除'
        page.accept_confirm
        expect(page).to have_content 'ログイン'
        expect(User.count).to eq 1
      end
      it '他人の会員詳細画面にアクセスすると教材一覧ページに遷移すること' do
        visit user_path(id: 2)
        expect(current_path).to eq materials_path
      end
      it '他人の会員編集・アカウント削除画面にアクセスすると自分の会員編集・アカウント削除画面に遷移すること' do
        visit edit_user_registration_path(2)
        expect(page).to have_field 'user[name]', with: 'sample'
      end
    end
  end
  describe '管理者機能のテスト' do
    context 'ユーザーが管理者の場合' do
      it '管理者画面にアクセスすることができる' do
        test_user_create(:admin_user)
        visit new_user_session_path
        fill_in 'user[email]', with: 'second_admin@example.com'
        fill_in 'user[password]', with: '0000000'
        click_on 'commit'
        visit rails_admin_path
        expect(current_path).to eq rails_admin_path
      end
    end
    # context 'ユーザーが管理者ではない場合' do
    #   it '管理者画面にアクセスすることができない' do
    #     test_user_create(:user)
    #     visit new_user_session_path
    #     fill_in 'user[email]', with: 'sample@example.com'
    #     fill_in 'user[password]', with: '0000000'
    #     click_on 'commit'
    #     visit rails_admin_path
    #     expect(page).to have_content 'You are not authorized to access this page.'
    #   end
    # end
  end
end
