require 'rspec'

#set up environment
ENV['RACK_ENV'] = 'test'
$LOAD_PATH << './lib'
$LOAD_PATH << './app/controllers'
$LOAD_PATH << './app/models'

#add capybara setup
require 'capybara/rspec'
require 'capybara'
require 'capybara/dsl'
require 'app_controller'

Capybara.app = Chitter

#add simple cov setup to rspec setup file=>>
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([SimpleCov::Formatter::Console])
SimpleCov.start

RSpec.configure do |config|

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation

  config.after(:suite) do
    puts
  end
end
