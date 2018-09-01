class User

  attr_reader :username

  def initialize(username)
    @username = username
  end

  def self.signup(params)
    name = params['name']
    email = params['email']
    password = params['password']
    username = params['username']
    sqlquery = "INSERT INTO users(name, email, password, username) VALUES('#{name}', '#{email}', '#{password}', '#{username}') RETURNING username;"
    result = DatabaseConnection.query(sqlquery)
    result[0]['username']
  end

end
