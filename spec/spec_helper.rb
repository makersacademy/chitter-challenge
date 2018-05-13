require 'capybara'
require 'capybara/rspec'
require 'rspec'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = PeepManager

ENV['ENVIROMENT'] = 'test'
# ENV['RACK_UP'] = 'test'

RSpec.configure do |config|
  config.before(:each) do
    require './lib/set_up_environ.rb'
  end
end
