require 'pg'

def database_cleaner

  test_database = PG.connect(dbname: 'chitter_test')
  test_database.exec("DROP TABLE messages")

  test_database.exec("CREATE TABLE messages 
    (id SERIAL PRIMARY KEY, content VARCHAR(100), created_at TIMESTAMP DEFAULT NOW(), name VARCHAR(50) DEFAULT 'No_name')")

  test_database.exec("INSERT INTO messages(content,name) VALUES ('Test message number 1','Test name 1')")
  test_database.exec("INSERT INTO messages(content,name) VALUES ('Test message number 2','Test name 2')")
  test_database.exec("INSERT INTO messages(content,name) VALUES ('Test message number 3','Test name 3')")
  

end
