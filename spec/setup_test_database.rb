# frozen_string_literal: true

require 'pg'

def setup_test_database
  p 'Cleaning up duckboard_test database ...'
  connection = PG.connect(dbname: 'duckboard_test')
  connection.exec('TRUNCATE quacks;')
end
