class User
  attr_reader :id, :name, :email, :username, :password

  class << self
    def create(name:, username:, email:, password:)
      row = DatabaseConnection.query(
        "INSERT INTO users (name, username, email, password)
        VALUES ('#{name}', '#{username}', '#{email}', '#{password}')
        RETURNING *;"
      ).first

      new(id: row['id'], name: row['name'], email: row['email'],
        username: row['username'], password: row['password'])
    end

    def find_id(id)
      row = DatabaseConnection.query(
        "SELECT * FROM users WHERE id = #{id}"
      ).first

      new(id: row['id'], name: row['name'], email: row['email'],
        username: row['username'], password: row['password'])
    end

    def find_username(username)
      row = DatabaseConnection.query(
        "SELECT * FROM users WHERE username = '#{username}';"
      ).first
      new(id: row['id'], name: row['name'], email: row['email'],
        username: row['username'], password: row['password'])
    end

    def authenticate(username:, password:)
      result = DatabaseConnection.query("
        SELECT * FROM users WHERE username = '#{username}'"
      ).first
      return !!result unless result

      password == result['password']
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
