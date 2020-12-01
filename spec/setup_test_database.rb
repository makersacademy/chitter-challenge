# frozen_string_literal: true

require 'pg'

p 'Setting up test database...'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_challenge_test')

  # Clear the accounts table and cascade to the peeps table
  connection.exec('TRUNCATE accounts CASCADE;')
  # Create guest account
  connection.exec("INSERT INTO accounts (forename,surname,username,email,password) VALUES ('Guest_name','Guest_surname','Guest','lucyjstringer+guest@gmail.com','guest123');")

end
