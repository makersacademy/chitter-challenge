# frozen_string_literal: true

require 'pg'

def setup_test_database
  p 'Cleaning up cheetboard_test database ...'
  connection = PG.connect(dbname: 'cheetboard_test')
  connection.exec('TRUNCATE cheets;')
end
