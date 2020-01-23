require 'rspec'

#set up environment
ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'
$LOAD_PATH << './app/controllers'

#add capybara setup
require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec'
require 'app_controller'

Capybara.app = Chitter

#add simple cov setup to rspec setup file=>>
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([SimpleCov::Formatter::Console])
SimpleCov.start

RSpec.configure do |config|

  config.after(:each) do
    con = PG.connect(:dbname => 'chitter-test', :user => ENV['USER'])

    # add test user
    user_id = con.exec("INSERT INTO users(username, email, password_hash, display_name) VALUES('test-user', 'test@test.com', '54afa97407b6b1aac35e8550365cc7c8', 'Test User') RETURNING user_id;")
    user_id = user_id[0]['user_id']

    # add test messages
    con.exec("INSERT INTO messages(text, user_id_fkey) VALUES('Test message 1 :)', '#{user_id}') ;")
    message_id = con.exec("INSERT INTO messages(text, user_id_fkey) VALUES('Test message 2 :)', '#{user_id}') RETURNING message_id;")
    message_id = message_id[0]['message_id']

    # add test comments
    comment_id = con.exec("INSERT INTO messages(text, user_id_fkey, related_id) VALUES('Test comment 1 :)', '#{user_id}', '#{message_id}') RETURNING message_id;")
    comment_id = comment_id[0]['message_id']
    con.exec("INSERT INTO messages(text, user_id_fkey, related_id) VALUES('Test comment 2 ;)', '#{user_id}', '#{comment_id}');")
  end

  config.after(:each) do
    con = PG.connect(:dbname => 'chitter-test', :user => ENV['USER'])
    # wipe database after test
    con.exec("TRUNCATE users, messages, tags, tags_messages;")
  end

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation

  config.after(:suite) do
    puts
  end
end
