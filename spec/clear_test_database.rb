def clear_test_database
  p 'Clearing test database...'
  connection = PG.connect dbname: 'bookmark_manager_test'
  connection.exec('TRUNCATE bookmarks')
end
