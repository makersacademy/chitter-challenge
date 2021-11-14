require 'pg'

p 'Setting up test data... please be patient whilst it loads.'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_data_test')

  # Clear the tables
  connection.exec('TRUNCATE peeps;')
end
