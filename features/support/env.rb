# Generated by cucumber-sinatra. (2015-04-10 10:12:25 +0100)

# rubocop:disable all

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'app/server.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = Chitter

class ChitterWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  ChitterWorld.new
end
