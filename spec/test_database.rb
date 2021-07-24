require 'pg'

def fresh_table
  test_db = PG.connect(dbname: 'chitter_test')
  test_db.exec('TRUNCATE TABLE user_data;')
end