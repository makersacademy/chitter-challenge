require 'bcrypt'
require 'pg'

class User
  def initialize(id, handle, password)
    @id = id
    @handle = handle
    @password = password
  end

  def self.create(handle, password)
    encrypted = BCrypt::Password.create(password)
    conn = User.connect
    id = conn.prepare("add_user", "INSERT INTO users (handle, password) VALUES($1, $2) RETURNING id;")
    conn.exec_prepared("add_user", [handle, encrypted])
    User.new(id, handle, password)
  end

  private

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end
end
