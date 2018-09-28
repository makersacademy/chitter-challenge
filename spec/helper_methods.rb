require 'pg'

def empty_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE users RESTART IDENTITY;'\
    'TRUNCATE peeps RESTART IDENTITY')
end
