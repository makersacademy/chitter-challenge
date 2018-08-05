require 'pg'
 
p "Cleaning database..."
 
connection = PG.connect(dbname: "chitter_test")
 # Clear the database
connection.exec("TRUNCATE peepers;")

# connection.exec("INSERT INTO peepers VALUES(1, 'finn_the_human', 'Finn', 'Mathematical!');")
