source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 5.2.4'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
# 追加
gem 'cancancan'
gem 'devise'
gem 'devise-i18n'
gem 'rails_admin', '~> 2.0'
gem 'rakuten_web_service'
gem 'acts-as-taggable-on', '~> 6.0'
gem 'kaminari'
gem 'ransack'
gem 'faker'
gem 'enum_help'
gem 'devise-bootstrap-views', '~> 1.0'
gem 'faraday'
gem 'fullcalendar-rails'
gem 'jquery-rails'
gem 'momentjs-rails'
gem 'dotenv-rails'
gem 'mini_racer', platforms: :ruby
gem 'unicorn'
gem 'aws-sdk-rails'
# bundle exec cap production deploy:check時のエラー対処のため追加
gem 'bcrypt_pbkdf'
gem 'ed25519'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'
  gem 'factory_bot_rails'
  gem 'launchy'
  gem 'rspec-rails', '~> 3.8'
  gem 'rspec-retry'
  gem 'rubocop', '~> 0.93.1', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'spring-commands-rspec'
  gem 'capistrano', '3.6.0'
  gem 'capistrano3-unicorn'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'database_rewinder'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
