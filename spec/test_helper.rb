require 'pg'

def reset_table
  connection = PG.connect(dbname: 'twitter_test')
  connection.exec("TRUNCATE TABLE tweets, users RESTART IDENTITY;")
  connection.exec("INSERT INTO tweets (tweet) VALUES ('my first tweet')")
end
