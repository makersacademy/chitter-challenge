
ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'lib/server.rb')

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
