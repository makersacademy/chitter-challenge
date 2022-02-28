require 'pg'

namespace :db do
  sql = File.open('./db/migrations/create_table.sql').read

  task :production_setup do
    connection = PG::Connection.new(ENV['DATABASE_URL'])

    connection.exec(sql)
  end

  task :local_setup do
    puts "Creating databases..."

    ['chitter', 'chitter_test'].each do |database|
      connection = PG.connect

      connection.exec("CREATE DATABASE #{database};")

      connection = PG.connect(dbname: database)

      connection.exec(sql)
    end
  end

  task :teardown do
    puts "Type 'y' to confirm that you want to destroy the Chitter databases. "\
    'This will remove all data in those databases!'

    confirm = STDIN.gets.chomp

    return unless confirm == 'y'

    puts 'Destroying databases...'

    ['chitter', 'chitter_test'].each do |database|
      connection = PG.connect
      connection.exec("DROP DATABASE #{database}")
    end
  end
end
