require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE peeps;')
<<<<<<< HEAD
end
=======
end
>>>>>>> dab571213c8f9abdec2809f7e4d02f6c10cfe18e
