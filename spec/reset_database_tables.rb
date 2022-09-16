class ResetDatabaseTables
  def reset
    seed_sql = File.read('spec/seeds/seeds_tests.sql')
    user = ENV['PGUSER1']
    password = ENV['PGPASSWORD']
    connection = PG.connect({ 
      host: '127.0.0.1',
      dbname: 'chitter_test',
      user: user,
      password: password 
    })
    connection.exec(seed_sql)
  end
end
