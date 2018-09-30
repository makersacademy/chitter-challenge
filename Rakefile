require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]

end


task :setup do
  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect(dbname: database)
    connection.exec('CREATE TABLE IF NOT EXISTS peeps(id SERIAL PRIMARY KEY, '\
      'contents VARCHAR(300), timestamp TIMESTAMPTZ, user_id INTEGER);')
    connection.exec('CREATE TABLE IF NOT EXISTS users(id SERIAL PRIMARY KEY, '\
      'username VARCHAR(100), name VARCHAR(100), email VARCHAR(100), password '\
      'VARCHAR(100));')
    connection.exec('CREATE TABLE IF NOT EXISTS replies(id SERIAL PRIMARY KEY, '\
      'original_id INTEGER, reply_id INTEGER);')
  end
end
