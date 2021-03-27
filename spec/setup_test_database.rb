require 'pg'

p "Setting up test shouter database table with no entries..."

def connect_to_test_database
	 PG.connect(dbname: 'shouter_database_test')
end

def clean_test_database(connection)
	 connection.exec("DROP TABLE IF EXISTS shouts")
end

def create_bookmarks_table_in_test(connection)
	connection.exec("CREATE TABLE shouts(shout_id SERIAL PRIMARY KEY, author VARCHAR(60), time_shouted VARCHAR(60), shout_content VARCHAR(100));")
end

# def populate_bookmarks_table(connection)
# 	 connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.makersacademy.com', 'Makers Academy'),('http://www.destroyallsoftware.com','Destroy All Software'),('http://www.google.com','Google')")
# end

def setup_test_database
	 connection = connect_to_test_database
	 clean_test_database(connection)
	 create_bookmarks_table_in_test(connection)
	 # populate_bookmarks_table(connection)
end
