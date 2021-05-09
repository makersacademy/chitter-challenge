require 'bcrypt'

class User
  attr_reader :id, :name, :email, :username, :password

  class << self
    def create(name:, username:, email:, password:)
      password_hash = BCrypt::Password.create(password)
      sql_string = [
        "INSERT INTO users (name, username, email, password) VALUES ('#{name}'",
        ", '#{username}', '#{email}', '#{password_hash}') RETURNING *;"
      ].join

      build(query(sql_string)[0])
    end

    def find(id:)
      build(query("SELECT * FROM users WHERE id = #{id}")[0])
    end

    def authenticate(username:, password:)
      data = query("SELECT * FROM users WHERE username = $$#{username}$$").first
      return unless data
      return unless BCrypt::Password.new(data['password']) == password

      build(data)
    end

    def update(id:, name:, username:, email:)
      sql_string = [
        "UPDATE users SET name = $$#{name}$$, ",
        "username = $$#{username}$$, email = $$#{email}$$ WHERE id = #{id};"
      ].join

      query(sql_string)
    end

    def delete(id:)
      query("DELETE FROM users WHERE id = #{id};")
    end

    private

    def build(data)
      new(id: data['id'], name: data['name'], email: data['email'],
        username: data['username'], password: data['password'])
    end

    def query(sql_string)
      DatabaseConnection.query(sql_string)
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
