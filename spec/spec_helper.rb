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
    user_id = con.exec("INSERT INTO users(username, email, password_hash, display_name) VALUES('test-user', 'test@test.com', '54afa97407b6b1aac35e8550365cc7c8', 'Test User') RETURNING user_id;")
    user_id = user_id[0]['user_id']
    con.exec("INSERT INTO messages(text, user_id_fkey) VALUES('Test message 1 :)', '#{user_id}') ;")
    message_id = con.exec("INSERT INTO messages(text, user_id_fkey) VALUES('Test message 2 :)', '#{user_id}') RETURNING message_id;")
    message_id = message_id[0]['message_id']
    con.exec("INSERT INTO comments(text, user_id_fkey, message_id_fkey) VALUES('Test comment 1 :)', '#{user_id}', '#{message_id}');")
    con.exec("INSERT INTO comments(text, user_id_fkey, message_id_fkey) VALUES('Test comment 2 ;)', '#{user_id}', '#{message_id}');")
  end

  config.after(:each) do
    con = PG.connect(:dbname => 'chitter-test', :user => ENV['USER'])
    con.exec("TRUNCATE users, messages, comments, tags, tags_messages_comments;")
  end

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation

  config.after(:suite) do
    puts
  end
end
