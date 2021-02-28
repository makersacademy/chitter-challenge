require 'bcrypt'

class User
  attr_reader :id, :name, :email, :username, :password

  class << self
    def create(name:, username:, email:, password:)
      password_hash = BCrypt::Password.create(password)
      row = DatabaseConnection.query(
        "INSERT INTO users (name, username, email, password)
        VALUES ('#{name}', '#{username}', '#{email}', '#{password_hash}')
        RETURNING *;"
      ).first

      new(id: row['id'], name: row['name'], email: row['email'],
        username: row['username'], password: row['password'])
    end

    def find(id:)
      row = DatabaseConnection.query(
        "SELECT * FROM users WHERE id = #{id}"
      ).first

      new(id: row['id'], name: row['name'], email: row['email'],
        username: row['username'], password: row['password'])
    end

    def authenticate(username:, password:)
      row = DatabaseConnection.query("SELECT * FROM users
        WHERE username = '#{username}'").first

      return unless row
      return unless BCrypt::Password.new(row['password']) == password

      new(id: row['id'], name: row['name'], email: row['email'],
        username: row['username'], password: row['password'])
    end

    def update(id:, name:, username:, email:)
      DatabaseConnection.query("UPDATE users
        SET name = '#{name}', username = '#{username}', email = '#{email}'
        WHERE id = #{id};")
    end
  end

  def initialize(id:, name:, email:, username:, password:)
    @id       = id
    @name     = name
    @email    = email
    @username = username
    @password = password
  end
end
