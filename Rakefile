if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  require 'pg'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]

  task :setup do
    puts "Creating databases..."
    ['chitter_development', 'chitter_test'].each do |database|
      con = PG.connect
      con.exec("CREATE DATABASE #{database}")
      con = PG.connect dbname: database
      con.exec("CREATE TABLE comments (id SERIAL PRIMARY KEY, comment VARCHAR(240))")
    end
  end

  # task :test_database_setup do
  #   puts 'Setting up test database...'
  #   con = PG.connect dbname: 'chitter_test'
  #   # con.exec("DROP TABLE IF EXISTS comments")
  #   # con.exec("CREATE TABLE comments (id SERIAL PRIMARY KEY, comment VARCHAR(240))")
  #   # con.exec("INSERT INTO comments(comment) VALUES('Im hungry')")
  #
  # end
end
