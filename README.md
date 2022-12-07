# yatta（停止中）

## URL
https://glacial-waters-33980.herokuapp.com/  
※デプロイ先をawsからherokuに変更。  
※以下のインフラ構成は以前の構成。

## 概要
学習教材（書籍等）の進捗を管理するサービス。
書籍を購入したが、途中まで学習して、そのまま放置している。
どこまでやったか覚えてない。どんな教材を買ったか忘れた。
このアプリに教材の情報を登録し、どこまで学習したかを管理することができます。

## 特徴
### 教材の簡易登録機能
教材の登録が面倒の方のために、WEBAPIを利用した書籍とQiita記事の簡易教材登録機能を用意しております。
本アプリケーション上で登録したい書籍、Qiita記事の情報を検索し、簡単に登録することができます。

## インフラ構成
### インフラ構成図
![Yattaインフラ構成図-20210128](https://user-images.githubusercontent.com/60159339/106317895-4ec27680-62b2-11eb-9a1a-5b96d7f642fd.png)

### 特徴：冗長化することでの可用性の高い設計
- EC2インスタンスをマルチAZ構成にし、ALBでアクセスを振り分けることで、サーバーの冗長化と負荷分散を実施。
- RDSのマルチスレーブ方式を採用し、DBの冗長化を実施。
- RDSの自動バックアップ機能により、高い可用性、耐久性を実現。\
(バックアップデータは5分おきにS3に保存され、S3では3つのAZにデータを保管する)

## バージョン情報
- Ruby on Rails 5.2.4
- Ruby 2.6.5

## 使用技術
- Ruby
- Ruby on Rails
- Nginx
- unicorn
- capistrano
- rubocop
- rspec
- CircleCI
- Docker
- AWS
  - EC2
  - RDS
  - ELB
  - CloudWatch
  - SNS
  - SES

## 機能一覧
- ログイン機能
- ユーザー登録機能
- ユーザー退会機能
- ユーザー詳細機能
- ユーザー編集機能
- 教材投稿機能
- 教材検索機能（RakutenAPI、QiitaAPI）
- 教材一覧表示機能
  - 絞り込み検索機能
- 教材編集機能
- 教材削除機能
- 教材詳細機能
  - 学習情報：詳細表示機能
- 学習情報：一覧表示機能
- 学習情報：新規登録機能
- 学習情報：編集機能
- 学習情報：削除機能
- 管理者機能
- 教材：タグ機能

## カタログ設計・テーブル定義
https://docs.google.com/spreadsheets/d/1rCgeV-_ULvsspHWy-aDRg0xxa6QI474rLmqZv_Yqedc/edit?usp=sharing

## ER図
https://drive.google.com/file/d/1fSgwETRoVL0m6iMGCYzRcklLyj5F9_O9/view?usp=sharing

## 画面遷移図
https://drive.google.com/file/d/1hKtj5UYCG3yx69kjTDtNiW9HQyV_ff_j/view?usp=sharing

## 画面ワイヤーフレーム
https://drive.google.com/file/d/1u4qmaDcVK3dbD_cQSysialihcJ9RUmlL/view?usp=sharing

## その他（2021.1.3時点）
### コストを考慮し、下記対応。
- インスタンス1台を停止。ElasticIPを解放。
  - インスタンス1台のデプロイコマンド\
    `ROLES=web1 bundle exec cap production deploy`
  - インスタンスを2台に戻す場合は、下記作業が必要。
    - ElasticIPの取得、割当。
    - `/config/deploy/production.rb`のIPアドレス編集
    - `/etc/nginx/conf.d/yatta.conf`のIPアドレス編集
    - `script/deploy_staging.sh`の`cap production deploy`コマンド編集
- RDSのマルチAZ方式を解除。

