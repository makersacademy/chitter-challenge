require 'pg'
def set_up_database
p "Setting up test database..."

connection = PG.connect(dbname: 'chitter_test')

# Clear the peep table
connection.exec("TRUNCATE peep;")
end
