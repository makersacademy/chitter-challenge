# frozen_string_literal: true

require 'pg'

def setup_test_database
  p 'Setting up test database...'
  connection = PG.connect(dbname: 'bookmark_tester')

  connection.exec('TRUNCATE bookmarks;')
end
