# frozen_string_literal: true

require 'pg'

p 'Setting up test database...'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_challenge_test')

  # Clear the peeps table
  connection.exec('TRUNCATE peeps;')
  # Clear the accounts table
  connection.exec('TRUNCATE accounts;')
end
