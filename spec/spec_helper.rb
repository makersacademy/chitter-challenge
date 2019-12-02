require 'simplecov'
require 'simplecov-console'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|

  ENV['RACK_ENV'] = 'test'

  config.after(:suite) do

    # ENV['RACK_ENV'] = nil
    # puts "\nRACK_ENV set to nil"

  end

end
