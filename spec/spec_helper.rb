ENV['RACK_ENV'] = 'test'

require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'pg'
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                   SimpleCov::Formatter::Console,
                                                               # Want a nice code coverage website? Uncomment this next line!
                                                               # SimpleCov::Formatter::HTMLFormatter
                                                               ])
SimpleCov.start

require_relative './features/web_helpers'
require_relative '../app'
require_relative './back-end_helpers'



Capybara.app = ChitterApp

RSpec.configure do |config|

  config.after(:each) do
    truncate_db
  end

end