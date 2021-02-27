class User
  attr_reader :id, :name, :email, :username, :password

  def self.create(name:, username:, email:, password:)
    row = DatabaseConnection.query(
      "INSERT INTO users (name, username, email, password)
      VALUES ('#{name}', '#{username}', '#{email}', '#{password}') RETURNING *;"
    ).first

    new(
      id:       row['id'],
      name:     row['name'],
      email:    row['email'],
      username: row['username'],
      password: row['password']
    )
  end

  def initialize(id:, name:, email:, username:, password:)
    @id       = id
    @name     = name
    @email    = email
    @username = username
    @password = password
  end
end
