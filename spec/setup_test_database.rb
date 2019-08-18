# frozen_string_literal: true

require 'pg'
def setup_test_database
  p 'Setting up test database...'
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE posts;')
end
