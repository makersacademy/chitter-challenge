if ENV['RACK_ENV'] == 'testing'

  require 'rspec/core/rake_task'
  require 'pg'
  require './lib/db_connection.rb'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]

  task :test_setup do
    p "Accessing the #{DB_Connection.dbname} database..."
    DB_Connection.setup('phoenix_test')
    DB_Connection.query('DELETE FROM summons')
    DB_Connection.query('ALTER SEQUENCE summons_id_seq RESTART WITH 1')
    DB_Connection.query("INSERT INTO summons (phoenix, summoner, timestamp) VALUES ('OMG Final Fantasy is the best!', 'julesnuggy', '2018-03-17 17:00:00+00');")
    DB_Connection.query("INSERT INTO summons (phoenix, summoner, timestamp) VALUES ('I completely agree.', 'zantetsuken', '2018-03-17 17:06:20+00');")
    DB_Connection.query("INSERT INTO summons (phoenix, summoner, timestamp) VALUES ('You guys sound like awesome people!', 'renzokuken', '2018-03-17 17:30:09+00');")
  end
end
