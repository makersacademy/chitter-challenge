require 'pg'

task :production_setup do
  connection = PG::Connection.new(ENV['DATABASE_URL'])

  connection.exec(
    'CREATE TABLE peeps(
    id SERIAL PRIMARY KEY,
    peep VARCHAR(140),
    user_email VARCHAR(30),
    time VARCHAR(30));'
  )
  connection.exec(
    'CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    email VARCHAR(60),
    password VARCHAR(140));'
  )
end

task :local_setup do
  puts "Creating databases..."

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect(dbname: database)

    connection.exec("CREATE DATABASE #{database};")

    connection.exec(
      'CREATE TABLE peeps(
      id SERIAL PRIMARY KEY,
      peep VARCHAR(140),
      user_email VARCHAR(30),
      time VARCHAR(30));'
    )
    connection.exec(
      'CREATE TABLE users(
      id SERIAL PRIMARY KEY,
      email VARCHAR(60),
      password VARCHAR(140));'
    )
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
