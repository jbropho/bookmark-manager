require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require_relative '../lib/helper'
require_relative '../lib/app'
require_relative '../lib/bookmark'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  ENV['RACK_ENV'] = 'test'
  require './lib/app.rb'
  require 'rack/test'
  require 'capybara'
  require 'capybara/rspec'
  Capybara.app = BookmarkApp

  config.before(:each) do
    conn = PG::Connection.open(:dbname => 'bookmark_manager_test')
    conn.exec_params('TRUNCATE bookmarks;')
  end
end
