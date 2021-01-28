# # ベースとなるイメージ
# FROM ruby:2.6.5

# # RUN ... docker build 時に実行するコマンド
# # RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
# RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# RUN mkdir /yata-app

# # コンテナにyata-appディレクトリを作ってyata-appディレクトリに移動する
# WORKDIR /yata-app

# # yata-appディレクトリにコピーする
# COPY Gemfile /yata-app/Gemfile
# COPY Gemfile.lock /yata-app/Gemfile.lock
# # エラー対応
# RUN gem install bundler
# RUN bundle install

# COPY . /yata-app

FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# chromeの追加
RUN apt-get update && apt-get install -y unzip && \
    CHROME_DRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
    wget -N http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip -P ~/ && \
    unzip ~/chromedriver_linux64.zip -d ~/ && \
    rm ~/chromedriver_linux64.zip && \
    chown root:root ~/chromedriver && \
    chmod 755 ~/chromedriver && \
    mv ~/chromedriver /usr/bin/chromedriver && \
    sh -c 'wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -' && \
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' && \
    apt-get update && apt-get install -y google-chrome-stable

RUN mkdir /myapp
WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem install bundler:2.1.4
RUN bundle install
COPY . /myapp/

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]