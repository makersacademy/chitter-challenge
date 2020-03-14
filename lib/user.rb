class User

  attr_reader :id, :name, :username, :email, :password

  def initialize(id:, name:, username:, email:, password:)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.all
    DatabaseConnection.setup(environment)
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map { |user| user }
  end

  def self.create(name:, username:, email:, password:)
    DatabaseConnection.setup(environment)
    query = "INSERT INTO users (name, username, email, password) VALUES ('#{name}', '#{username}', '#{email}', '#{password}') RETURNING id, name, username, email, password"
    result = DatabaseConnection.query(query)
    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
  end

  def self.authenticate(username:, password:)
    DatabaseConnection.setup(environment)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}'")
    return unless result.any?
    return unless result[0]['password'] == password

    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
  end

  def self.exists?(username:, email:)
    DatabaseConnection.setup(environment)
    username = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}'")
    email = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    username.any? || email.any? ? true : false
  end

  def self.environment
    ENV['RACK_ENV'] == 'test' ? 'chitter_app_test' : 'chitter_app'
  end

end
