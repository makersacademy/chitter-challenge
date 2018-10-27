if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

require 'pg'

task :build_databases do
  ['chitter', 'chitter_test'].each do |db|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{db};")

    connection = PG.connect(dbname: db)
    connection.exec("CREATE TABLE peeps (
      id SERIAL PRIMARY KEY,
      text VARCHAR(100),
      time TIME,
      username VARCHAR(60)
      );"
    )
  end
end

task :clear_test_database do
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE TABLE peeps;")
end
