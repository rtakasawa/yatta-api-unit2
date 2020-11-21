require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)

abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'

# SystemHelpersをsystemspec内で利用できるように設定した
require 'support/system_helpers'

# dockerでのsystemspec用に追記
Capybara.register_driver :remote_chrome do |app|
  url = "http://chrome:4444/wd/hub"
  caps = ::Selenium::WebDriver::Remote::Capabilities.chrome(
    "goog:chromeOptions" => {
      "args" => [
        "no-sandbox",
        "disable-gpu",
        "window-size=1680,1050"
      ]
    }
  )
  Capybara::Selenium::Driver.new(app, browser: :remote, url: url, desired_capabilities: caps)
end

RSpec.configure do |config|
  config.include SystemHelpers, type: :system
end

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # Devise_confirmableのテストのため、テストの最後のトランザクションを使わないように設定する
  config.use_transactional_fixtures = false

  # database_rewinder のセットアップ
  config.before(:suite) do
    DatabaseRewinder.clean_all
  end

  config.after(:each) do
    DatabaseRewinder.clean
  end

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  # dockerでのsystemspec用に追記
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  # dockerでのsystemspec用に追記
  config.before(:each, type: :system, js: true) do
    driven_by :remote_chrome
    Capybara.server_host = IPSocket.getaddress(Socket.gethostname)
    Capybara.server_port = 3000
    Capybara.app_host = "http://#{Capybara.server_host}:#{Capybara.server_port}"
  end
end