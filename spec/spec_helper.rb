require "simplecov"
require "simplecov-console"

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
# Want a nice code coverage website? Uncomment this next line!
# SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

ENV["RACK_ENV"] = "test"

require "warning"
Gem.path.each do |path|
  Warning.ignore(//, path)
end

require "capybara/rspec"
require "pg"
require "./app/app"

require_relative "support/database_cleaner.rb"
require_relative "support/sessions_helper.rb"

Capybara.app = Chitter
