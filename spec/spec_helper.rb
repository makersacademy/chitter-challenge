require 'simplecov'
require 'simplecov-console'
require 'pg'
require 'capybara'
require 'capybara/rspec'
require './app.rb'
require 'rack/test'
require 'rspec'

Capybara.app = Chitter

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../app.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure { |c| c.include RSpecMixin }

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end

  config.before(:each) do
  allow(ENV).to receive(:[]).with('DATABASE').and_return('chitter_test')
  connection = PG.connect :dbname => ENV['DATABASE']
  connection.exec ("INSERT INTO peeps (poster, time, content) VALUES ('ChitterBot', '01-01-18 00:00:00', 'Hello World!');")
  connection.exec ("INSERT INTO peeps (poster, time, content) VALUES ('ChitterBot', '01-01-18 00:01:00', 'Can somebody make me a cup of tea?');")
  end
end
