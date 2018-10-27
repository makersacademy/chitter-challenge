class User
  attr_reader :id, :username, :password

  def initialize(id:, username:, password:)
    @id = id
    @username = username
    @password = password
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users;")
    result.map { |user|
      User.new(id: user['id'], username: user['username'])
    }
  end

  def self.register(username:, password:)
    result = DatabaseConnection.query("INSERT INTO users(username, password)
    VALUES ('#{username}', '#{password}') RETURNING id, username, password;")
    result.map do |user|
      User.new(id: user['id'], username: user['username'],
        password: user['password'])
    end[0]
  end

  def self.find(username:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username =
      '#{username}' AND password = '#{password}';")
    result.map do |user|
      User.new(id: user['id'], username: user['username'],
        password: user['password'])
    end[0]
  end
end
