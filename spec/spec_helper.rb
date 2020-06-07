# frozen_string_literal: true

require 'simplecov'
require 'simplecov-console'

require 'capybara/rspec'
require 'rspec'
require 'capybara'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

ENV['RACK_ENV'] = 'test'
Capybara.app = ChitterBox

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                 SimpleCov::Formatter::Console
                                                                 # Want a nice code coverage website? Uncomment this next line!
                                                                 # SimpleCov::Formatter::HTMLFormatter
                                                               ])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
  end
end
