ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require 'rake'
require 'rspec/expectations'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

Rake.application.load_rakefile

RSpec.configure do |config|
  config.before(:each) do
    Rake::Task[:test_setup].execute
  end
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end

RSpec::Matchers.define :appear_below do |later_content|
  match do |earlier_content|
    begin
      page.body.index(earlier_content) < page.body.index(later_content)
      rescue ArgumentError
        raise "Could not locate later content on page: #{later_content}"
      rescue NoMethodError
        raise "Could not locate earlier content on page: #{earlier_content}"
    end
  end
end
