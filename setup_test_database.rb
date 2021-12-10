# frozen_string_literal: true

require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test')

  connection.exec('TRUNCATE messages;')
end
