# README

# yatta

## 概要
学習教材（書籍等）の進捗を管理するサービス。  
書籍を購入したが、途中まで学習して、そのまま放置している。  
どこまでやったか覚えてない。どんな教材を買ったか忘れた。  
このアプリに教材の情報を登録し、どこまで学習したかを管理することができます。

## コンセプト
学習教材の登録機能。  
教材（書籍）の登録を容易にするため、書籍関連のWEBAPIを使って、アプリ上で登録したい書籍の情報を検索し、登録することができます。

## バージョン
rails 5.2.4  
ruby 2.6.5

## 機能一覧
- [ ] ログイン機能
- [ ] ユーザー登録機能
- [ ] ユーザー退会機能
- [ ] 教材一覧表示機能
  - [ ] 検索機能、ソート機能
- [ ] 教材投稿機能
- [ ] 教材検索機能（書籍のみ）
- [ ] 教材編集機能
  - [ ] メモ機能はページ遷移なしで実行できる
- [ ] 教材削除機能
- [ ] 管理者機能 

## カタログ設計
https://drive.google.com/file/d/1Vc00qULlfd0hWBDpm6rFAFAEBr1GoFIK/view?usp=sharing

## テーブル定義
https://drive.google.com/file/d/1rTqxpQ22v-wt3DzltAXNVMW4K-VK-iiK/view?usp=sharing

## ER図
https://drive.google.com/file/d/1OJ1RQ4dSm7hIM_a3CEKxOWQs0bJ5UEW-/view?usp=sharing

## 画面遷移図
https://drive.google.com/file/d/1OX8XrqkXJFhxhyrqxIb2uUIN2BUotx_Z/view?usp=sharing

## 画面ワイヤーフレーム
https://drive.google.com/file/d/1mHeD_v8zo3EmslilzmYGLEt7ky3Je5dB/view?usp=sharing

## 使用予定Gem
* devise
* devise-i18n
* letter_opener_web
* rails_admin
* cancancan
* rakuten_web_service
* dotenv-rails
* pry-rails
* better_errors
* binding_of_caller
* ransak
* kaminari
* rspec-rails
* spring-commands-rspec
* factory_bot_rails
* faker
* launchy
* capybara
* webdrivers
* rspec-retry