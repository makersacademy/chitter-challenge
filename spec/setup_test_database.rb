# frozen_string_literal: true

require 'pg'

def setup_test_database
  p 'setting up test database ...'
  connection = PG.connect(dbname: 'chitter_test')
  # clear the bookmark table prior to rspec tests
  connection.exec('TRUNCATE peeps CASCADE;')
end
