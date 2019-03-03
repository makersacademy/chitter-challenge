require 'bcrypt'

class Maker
  attr_reader :name, :username

  def self.add(name, username, email, password)
    encrypted_password = BCrypt::Password.create(password)
    sql = "INSERT INTO makers
      (name, username, email, password)
      VALUES
      ('#{name}', '#{username}', '#{email}', '#{encrypted_password}');"
    DatabaseConnection.query(sql)
    @current_maker = username
  end

  def self.current
    @current_maker
  end

  def self.get(id:)
    sql = "SELECT * FROM makers WHERE id = #{id};"
    results = DatabaseConnection.query(sql)
    Maker.new(
        id: results.first['id'],
        name: results.first['name'],
        username: results.first['username'],
      )
  end

  def initialize(id:, name:, username:)
    @id = id
    @name = name
    @username = username
  end
end
