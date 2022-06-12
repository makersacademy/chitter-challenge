require 'pg'

conn = PG.conn(dbname: 'chitter_test')

# clear peeps table after each run of rspec
conn.exec("TRUNCATE peeps")
