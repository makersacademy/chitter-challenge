require 'pg'

p "Setting up the Database..."

#This connects to the bookmark manager test
conn = PG.connect(dbname: 'peep_test')

#This clears the bookmark table everytime this file is called
conn.exec("TRUNCATE peeps;")