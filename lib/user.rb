class User

  def self.create(email:, password:, name:, username:)
    result = DatabaseConnection.query("INSERT INTO users (email, password, name, username)
    VALUES('#{email}', '#{password}', '#{name}', '#{username}')
    RETURNING id, email, password, name, username;")
    User.new(id: result[0]['id'], email: result[0]['email'], password: result[0]['password'],
      name: result[0]['name'], username: result[0]['username'])
  end

  attr_reader :id, :email, :password, :name, :username

  def initialize(id:, email:, password:, name:, username:)
    @id = id
    @email = email
    @password = password
    @name = name
    @username = username
  end
end
