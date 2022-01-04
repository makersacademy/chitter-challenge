# frozen_string_literal: true

require 'pg'

def setup_test_database
  p 'Setting up test database...'

  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE peeps, users;')
  connection.exec("INSERT INTO users (user_id, username, name, email_address, password) VALUES (1, 'sergei', 'Sergei', 'sergei@test.com', 'password')");
end
