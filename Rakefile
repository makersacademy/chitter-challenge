require 'pg'
require 'rake'

require_relative 'app/lib/database_connection'

namespace :db do
  desc 'Connect to database'
  task :connect do
    if ENV['ENVIRONMENT'] == 'test'
      DatabaseConnection.setup('chitter_test')
      puts '=== Connected to test database ==='
    else
      DatabaseConnection.setup('chitter')
      puts '=== Connected to development database ==='
    end
  end

  desc 'Clean test database'
  task :clean do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec('TRUNCATE users, posts RESTART IDENTITY;')
  end

  namespace :create do
    desc 'Create development and test databases'
    task :all do
      Rake::Task['create:test'].execute
      Rake::Task['create:development'].execute
    end

    desc 'Create development database'
    task :development do
      PG.connect.query("CREATE DATABASE chitter;")
    end

    desc 'Create test database'
    task :test do
      PG.connect.query("CREATE DATABASE chitter_test;")
    end
  end

  namespace :migrate do
    desc 'Migrate development and test database schema'
    task :all do
      Rake::Task['migrate:test'].execute
      Rake::Task['migrate:development'].execute
    end

    desc 'Migrate test database schema'
    task :test do
      migrate('chitter_test')
    end

    desc 'Migrate development database schema'
    task :development do
      migrate('chitter')
    end
  end
end

def migrate(db_name)
  connection = PG.connect(dbname: db_name)

  connection.exec(
    "CREATE TABLE users(
      id SERIAL PRIMARY KEY,
      name VARCHAR (60) NOT NULL,
      username VARCHAR (60) UNIQUE NOT NULL,
      email VARCHAR (255) UNIQUE NOT NULL,
      password VARCHAR (80) NOT NULL
      );"
    )

  connection.exec(
    "CREATE TABLE posts(
      id SERIAL PRIMARY KEY,
      content VARCHAR (280) NOT NULL,
      user_id INTEGER REFERENCES users (id) ON DELETE CASCADE,
      time TIMESTAMP DEFAULT CURRENT_TIMESTAMP (0)
      );"
    )
end
