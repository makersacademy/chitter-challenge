require 'pg'
require 'bcrypt'

def empty_test_users
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

def initialize_test_users
  empty_test_users
  populate_test_users
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
