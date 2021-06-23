require 'pg'

p "Hold up Stu, I'm just setting up Chitter_feed_test for you..."

connection = PG.connect(dbname: 'Chitter_feed_test')

connection.exec("TRUNCATE peeps, users;")