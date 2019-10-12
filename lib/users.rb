class Users
  attr_reader :id, :email, :name, :username

  def initialize(id:, email:, password:, name:, username:)
    @id = id
    @email = email
    @password = password
    @name = name
    @username = username
  end

  def self.create(email, password, name, username)
    return false unless user_unique?(email, username)

    result = DatabaseConnection.query("INSERT INTO users
      (email, password, name, username)
      VALUES ('#{email}', '#{password}', '#{name}', '#{username}')
      RETURNING id ")
    Users.new(
      id: result[0]['id'],
      email: email,
      password: password,
      name: name,
      username: username)
  end

  def self.user_unique?(email, username)
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE email = '#{email}' OR username = '#{username}';")
    result.ntuples.zero?
  end

  def self.find(email, password)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';")
    return false if result.ntuples.zero?

    return false if password != result[0]['password']

    Users.new(
      id: result[0]['id'],
      email: email,
      password: password,
      name: result[0]['name'],
      username: result[0]['username'])
  end
end
