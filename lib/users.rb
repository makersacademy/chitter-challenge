class Users
  attr_reader :id, :email, :username

  def initialize(id:, email:, username:)
    @id = id
    @email = email
    @username = username
  end

  def self.create(username:, email:, password:)
    result = DatabaseConnection.query("INSERT INTO users (username, email, password) VALUES('#{username}', '#{email}', '#{password}') RETURNING id, username, email;")
    Users.new(id: result[0]['id'], email: email, username: username)
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id='#{id}';")
    Users.new(id: id, email: result[0]['email'], username: result[0]['username'])
  end
end
