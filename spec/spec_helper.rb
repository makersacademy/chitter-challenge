require 'simplecov'
require 'simplecov-console'
require 'rack/test'
require 'mail'

Mail.defaults do
  delivery_method :test
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

ENV['RACK_ENV'] = "test"

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end

def session
  last_request.env['rack.session']
end
