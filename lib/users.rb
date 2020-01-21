class Users
  attr_reader :id, :email, :username

  def initialize(id:, email:, username:, password:)
    @id = id
    @email = email
    @username = username
    @password = password
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users;")
    result.map { |user| Users.new(id: user['id'], email: user['email'], username: user['username'], password: user['password']) }

  end

  def self.create(username:, email:, password:)
    result = DatabaseConnection.query("INSERT INTO users (username, email, password) VALUES('#{username}', '#{email}', '#{password}') RETURNING id, username, email, password;")
    Users.new(id: result[0]['id'], email: email, username: username, password: password)
  end
end
