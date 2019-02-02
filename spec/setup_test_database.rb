require 'pg'

def setup_test_database
p "Set up test database"

con = PG.connect(dbname: 'chitter_test')

# Clear bookmarks table
con.exec("TRUNCATE users;")
con.exec("TRUNCATE peeps")

end
