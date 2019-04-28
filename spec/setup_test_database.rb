require 'pg'

def clear_table

  p "Clearing up test database..."

  connection = PG.connect :dbname => 'chitter_test'

  connection.exec 'TRUNCATE TABLE posts, users'

end
