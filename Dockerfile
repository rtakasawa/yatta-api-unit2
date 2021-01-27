# ベースとなるイメージ
FROM ruby:2.6.5
# RUN ... docker build 時に実行するコマンド
RUN apt-get update && apt-get install -y \
      build-essential \
      libpq-dev \
      nodejs \
      postgresql-client \
      yarn

# コンテナにyata-appディレクトリを作ってyata-appディレクトリに移動する
WORKDIR /yata-app
# yata-appディレクトリにコピーする
COPY Gemfile Gemfile.lock /yata-app/
# エラー対応
RUN gem install bundler:2.1.4
RUN bundle install