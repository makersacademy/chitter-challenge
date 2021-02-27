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

    def find(id:)
      row = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id}")[0]

      new(id: row['id'], name: row['name'], email: row['email'],
        username: row['username'], password: row['password'])
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
