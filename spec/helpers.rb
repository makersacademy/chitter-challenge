def empty_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE users;')
end

def add_users(users)
  connection = PG.connect(dbname: 'chitter_test')
  users.each do |user|
    connection.exec("INSERT INTO userses VALUES(DEFAULT, '#{user}');")
  end
end
