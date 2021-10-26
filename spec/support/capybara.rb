# frozen_string_literal: true

# システムスペックがうまくいかないとき、ドライバーを変えて確認する。
# Capybara.javascript_driver = :selenium_chrome_headless

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end
end
Capybara.default_driver = :rack_test
