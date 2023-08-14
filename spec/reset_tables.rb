class ResetTables
  def reset_posts_table
    seed_sql = File.read('spec/seeds/post_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end

  def reset_users_table
    seed_sql = File.read('spec/seeds/user_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end
end
