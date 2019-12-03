# frozen_string_literal: true

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  require 'pg'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]

  task :setup do
    p 'Creating databases...'

    connection = PG.connect
    connection.exec('CREATE DATABASE chitter;')
    connection.exec('CREATE DATABASE chitter_test;')

    connection = PG.connect(dbname: 'chitter')
    connection.exec(<<-SQL)
    CREATE TABLE
      peeps(id SERIAL PRIMARY KEY,
            message VARCHAR(140),
            created_at TIMESTAMPTZ DEFAULT NOW()
      );
    SQL

    connection = PG.connect(dbname: 'chitter_test')
    connection.exec(<<-SQL)
    CREATE TABLE
      peeps(id SERIAL PRIMARY KEY,
            message VARCHAR(140),
            created_at TIMESTAMPTZ DEFAULT NOW()
      );
    SQL
  end
end
