require 'pg'

def reset_table
  connection = PG.connect(dbname: 'twitter_test')
  result = connection.exec("TRUNCATE TABLE tweets, users RESTART IDENTITY;")
  result = connection.exec("INSERT INTO tweets (tweet) VALUES ('my first tweet')")
end