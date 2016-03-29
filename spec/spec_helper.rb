ENV['RACK_ENV'] ||= 'test'

require File.join(File.dirname(__FILE__), '..', 'app/app.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'

require 'coveralls'
require 'simplecov'
require 'database_cleaner'

require 'web_helpers'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

Capybara.app = Chitter

RSpec::Matchers.define :appear_before do |later_content|
  match do |earlier_content|
    page.body.index(earlier_content) < page.body.index(later_content)
  end
end

RSpec.configure do |config|
  config.include Capybara::DSL

  config.backtrace_exclusion_patterns = [
  /\/lib\d*\/ruby\//,
  /bin\//,
  /gems/,
  /spec\/spec_helper\.rb/,
  /lib\/rspec\/(core|expectations|matchers|mocks)/
]

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

end
