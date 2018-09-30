require 'pg'
require 'bcrypt'

def empty_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE users RESTART IDENTITY;'\
    'TRUNCATE peeps RESTART IDENTITY')
end

def populate_test_users
  connection = PG.connect(dbname: 'chitter_test')
  users = [
    ['Billy', 'billy@mail.com', 'billy1', BCrypt::Password.create('password')],
    ['Barry', 'barry@mail.com', 'barry1', BCrypt::Password.create('password')],
    ['Berty', 'berty@mail.com', 'berty1', BCrypt::Password.create('password')]
  ]
  users.each do |user|
    connection.exec('INSERT INTO users(name, email, username, password) '\
      "VALUES('#{user[0]}', '#{user[1]}','#{user[2]}', '#{user[3]}');")
  end
end

def populate_test_peeps
  connection = PG.connect(dbname: 'chitter_test')
  peeps = [['Hello chitter', 1], ["What is up peeps", 2], ['Hi, Billy!', 3]]
  peeps.each do |peep|
    connection.exec('INSERT INTO peeps(contents, user_id, timestamp) '\
      "VALUES('#{peep[0]}', #{peep[1]}, NOW());")
  end
end

def initialize_test_database
  empty_test_database
  populate_test_users
  populate_test_peeps
end

def bcrypt_comparer(encrypted_query, unencrypted_query)
  return false unless encrypted_query.size == unencrypted_query.size

  encrypted_query.each_with_index do |entry, index|
    bcrypt_password = BCrypt::Password.new(entry[:password])
    return false unless bcrypt_password == unencrypted_query[index][:password]

  end
  true
end

def query_comparer(encrypted_query, unencrypted_query)
  return false unless encrypted_query.size == unencrypted_query.size

  encrypted_query.each_with_index do |entry, index|
    entry.keys.each do |key|
      return false unless entry[key] == unencrypted_query[index][key]
    end
  end
  true
end
