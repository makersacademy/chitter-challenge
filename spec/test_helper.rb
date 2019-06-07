require 'pg'
require 'bcrypt'

class SetupHelper
  attr_reader :id
  def initialize(id)
    @id = id
  end
end

def connection
  PG.connect :dbname => 'chitter_test'
end

def clear_db
  connection.exec "DELETE FROM posts"
  connection.exec "DELETE FROM users"
end

def fill_db
  encrypted_pass = BCrypt::Password.create('test')
  connection.exec "INSERT INTO users (name, username, password, email) VALUES ('Kelvin', 'kks110', '#{encrypted_pass}', 'test@test.com')"
  @user = find_user
  connection.exec "INSERT INTO posts (body, user_id) VALUES ('First Post', '#{@user.id}'), ('Second Post', '#{@user.id}')"
end

def find_user
  response = connection.exec "SELECT * FROM users WHERE name = 'Kelvin'"
  response.each do |row|
    return SetupHelper.new(row['id'])
  end
end

def db_test_prep
  clear_db
  fill_db
end
