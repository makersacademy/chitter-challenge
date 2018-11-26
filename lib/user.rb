class User

  attr_reader :id, :username, :name, :email, :password

  def initialize(id:, username:, name:, email:, password:)
    @id = id
    @username = username
    @name = name
    @email = email
    @password = password
  end

  def self.create(username:, name:, email:, password:)
    result = DatabaseConnection.query("INSERT INTO users
      (username, name, email, password)
      VALUES('#{username}', '#{name}','#{email}','#{password}')
      RETURNING id, username, name, email, password;")

    User.new(
      id: result[0]['id'],
      username: result[0]['username'],
      name: result[0]['name'],
      email: result[0]['email'],
      password: result[0]['password'])
  end

  def User.find(username:)
    user = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}';")
  end

  def User.login(username:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}' AND password = '#{password}';")
    if result.ntuples == 1
      User.new(
        id: result[0]['id'],
        username: result[0]['username'],
        name: result[0]['name'],
        email: result[0]['email'],
        password: result[0]['password'])
    else
      nil
    end
  end
end
