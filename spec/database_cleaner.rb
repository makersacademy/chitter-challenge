require 'pg'

def database_cleaner

  test_database = PG.connect( dbname: 'chitter_test' )
  test_database.exec( "DROP TABLE messages" )

  test_database.exec( "CREATE TABLE messages 
    (id SERIAL PRIMARY KEY, content VARCHAR(100), created_at TIMESTAMP DEFAULT NOW())" )

  test_database.exec( "INSERT INTO messages(content) VALUES ('Test message number 1')" )
  test_database.exec( "INSERT INTO messages(content) VALUES ('Test message number 2')" )
  test_database.exec( "INSERT INTO messages(content) VALUES ('Test message number 3')" )
  

end
