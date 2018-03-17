class User
  attr_reader :id, :email, :password, :username

  def initialize(id, username, email, password)
    @id = id
    @email = email
    @password = password
    @username = username
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map { |user| User.new(user['id'], user['username'], user['email'], user['password']) }
  end

  def self.create(options)
    result = DatabaseConnection.query("INSERT INTO users (username, email, password) VALUES('#{options[:username]}', '#{options[:email]}', '#{options[:password]}') RETURNING id, username, email, password;")
    User.new(result[0]['id'], result[0]['username'], result[0]['email'], result[0]['password'])
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}';")
    User.new(result[0]['id'], result[0]['username'], result[0]['email'], result[0]['password'])
  end
end
