require 'pg'

def reset_chitter_table
  seed_sql = File.read('seeds/chitter_testing_seed.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end
