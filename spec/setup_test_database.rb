require 'pg'

def setup_test_database!

	# p 'Resetting test database...'
	 connection = PG.connect(dbname: 'chitter_challenge_test')
	 connection.exec("TRUNCATE chitter RESTART IDENTITY;")
     connection.exec("TRUNCATE users RESTART IDENTITY;")

end
