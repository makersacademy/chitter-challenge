class User

  def self.create(username:, password:, name:, email:)
    query = "INSERT INTO users VALUES('#{username}', '#{password}', '#{name}', '#{email}');"
    DatabaseConnection.query(query)
    login(username: username, password: password)
  end

  def self.login(username:, password:)
    query = "SELECT * FROM users WHERE username = '#{username}' AND password = '#{password}'"
    result = DatabaseConnection.query(query)
    @current = User.new(
      username: username,
      password: password,
      name: result.first["name"],
      email: result.first["email"]
    )
  end

  def self.current
    @current
  end

  def self.current=(value)
    @current = value
  end

  attr_reader :username, :password, :name, :email
  def initialize(username:, password:, name:, email:)
    @username, @password, @name, @email = username, password, name, email
  end
end
