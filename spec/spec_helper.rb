ENV["RACK_ENV"] = 'test'

require 'capybara/rspec'
require './server'
require 'database_cleaner'


Capybara.app = Chitter

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
  
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end

   def add_post(username, message, hashtags = [])
    within('#new-post') do
      fill_in 'username', with: username
      fill_in 'message', with: message
      fill_in 'hashtag', with: hashtag.join(' ')
      click_button 'Post'
  end
end