require 'pg'
def setup_test_database
		p "Setting up test database..."

		connection = PG.connect(dbname: 'chitter_test')

		# Clear the peeps_test table
		connection.exec("TRUNCATE peeps;")
		connection.exec("TRUNCATE users;")
end
