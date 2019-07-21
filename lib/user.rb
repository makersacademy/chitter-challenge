class User

  attr_reader :id, :username, :email, :password

  def initialize(id, username, email, password)
    @id = id
    @username = username
    @email = email
    @password = password
  end

  def self.create(username, email, password)
    result = DatabaseConnection.query("INSERT INTO users (username, email, password) VALUES('#{username}', '#{email}', '#{password}') RETURNING id, username, email, password;")
    User.new(result[0]['id'], result[0]['username'], result[0]['email'], result[0]['password'])
  end

  def self.log_in(email, password)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';")
    User.new(result[0]['id'], result[0]['username'], result[0]['email'], result[0]['password'])
  end

  def self.find_user(id)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id};")
    User.new(result[0]['id'], result[0]['username'], result[0]['email'], result[0]['password'])
  end
end
