require 'pg'

def empty_test_users
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE users RESTART IDENTITY;'\
    'TRUNCATE peeps RESTART IDENTITY')
end

def populate_test_users
  connection = PG.connect(dbname: 'chitter_test')
  users = [
    ['Billy', 'billy@mail.co.uk', 'billy1', 'password'],
    ['Barry', 'barry@mail.co.uk', 'barry1', 'password'],
    ['Berty', 'berty@mail.co.uk', 'berty1', 'password']
  ]
  users.each do |user|
    connection.exec('INSERT INTO users(name, email, username, password) '\
      "VALUES('#{user[0]}', '#{user[1]}','#{user[2]}', '#{user[3]}');")
  end
end

def initialize_test_users
  empty_test_users
  populate_test_users
end
