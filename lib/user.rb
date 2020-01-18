class User

  def self.all
    DatabaseConnection.setup(environment)
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map { |user| user['name'] }
  end

  def self.create(name:, username:, email:, password:)
    DatabaseConnection.setup(environment)
    DatabaseConnection.query("INSERT INTO users (name, username, email, password) VALUES ('#{name}', '#{username}', '#{email}', '#{password}') RETURNING id, name, username, email, password")
  end

  def self.environment
    ENV['RACK_ENV'] == 'test' ? 'chitter_app_test' : 'chitter_app'
  end

end