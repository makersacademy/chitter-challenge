# frozen_string_literal: true

require 'pg'

def setup_test_database
  puts
  puts 'Setting up test database...'
  dbvals = [
    { :email => 'zimmermja@gmail.com', :password => 'password111', :fullname => 'Matt Zimmer', :username => 'Matt' },
    { :email => 'waynesworld@gmail.com', :password => 'waynestock', :fullname => 'Wayne Campbell', :username => 'Wayne' },
    { :email => 'mirthmobile@gmail.com', :password => 'woofgirl', :fullname => 'Garth Algar', :username => 'Garth' }
  ]
  connection = PG.connect(dbname: 'chitter_zimmja_test')
  connection.exec('TRUNCATE users;')
  dbvals.each do |user|
    connection.exec_params("INSERT INTO users (email, pword, fullname, username) values($1,$2,$3,$4);",
    [user[:email],user[:password],user[:fullname],user[:username]]) # Broken over two lines to ease readability
  end
end
