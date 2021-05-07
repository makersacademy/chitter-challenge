require 'bcrypt'

class User
  attr_reader :id, :name, :email, :username, :password

  class << self
    def create(name:, username:, email:, password:)
      password_hash = BCrypt::Password.create(password)
      data = DatabaseConnection.query(
        "INSERT INTO users (name, username, email, password)
        VALUES ('#{name}', '#{username}', '#{email}', '#{password_hash}')
        RETURNING *;"
      ).first

      build(data)
    end

    def find(id:)
      data = DatabaseConnection.query(
        "SELECT * FROM users WHERE id = #{id}"
      ).first

      build(data)
    end

    def authenticate(username:, password:)
      data = DatabaseConnection.query("SELECT * FROM users
        WHERE username = '#{username}'").first

      return unless data
      return unless BCrypt::Password.new(data['password']) == password

      build(data)
    end

    def update(id:, name:, username:, email:)
      DatabaseConnection.query("UPDATE users
        SET name = '#{name}', username = '#{username}', email = '#{email}'
        WHERE id = #{id};")
    end

    def delete(id:)
      DatabaseConnection.query("DELETE FROM users WHERE id = #{id};")
    end

    private

    def build(data)
      new(id: data['id'], name: data['name'], email: data['email'],
        username: data['username'], password: data['password'])
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
