ENV['RACK_ENV'] = 'test'
require 'simplecov'
require 'simplecov-console'
require 'capybara/rspec'

require './app.rb'
require './app/models/peep'

Capybara.app = ChitterChallenge

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                 SimpleCov::Formatter::Console,
                                                                 # Want a nice code coverage website? Uncomment this next line!
                                                                 # SimpleCov::Formatter::HTMLFormatter
                                                               ])
SimpleCov.start
