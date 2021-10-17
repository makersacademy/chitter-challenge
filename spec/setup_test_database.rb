require 'pg'

def setup_test_database
  ENV['ENVIRONMENT'] = 'test'


  p 'Setting up test database...'

  connection = PG.connect(dbname: 'chitter_test')

  connection.exec('TRUNCATE peeps, users;')

end 