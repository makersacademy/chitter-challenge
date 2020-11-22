require 'pg'

def clear_database
    connection = PG.connect(dbname: 'bookmark_manager_test')

  connection.exec("TRUNCATE bookmarks;")
end
