require 'pg'

def reset_table
  connection = PG.connect(dbname: 'twitter_test')
  connection.exec("TRUNCATE TABLE tweets, users, comment RESTART IDENTITY;")
  connection.exec("INSERT INTO users (name, email, password) VALUES ('David', 'testemail@example.com', 'password123');")
  connection.exec("INSERT INTO tweets (tweet, created_by) VALUES ('my first tweet', '1')")
end
