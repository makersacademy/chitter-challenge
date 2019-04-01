require_relative 'database_connection'

class User
  attr_reader :id, :email, :password

  def initialize(id:, email:, password:)
    @id = id
    @email = email
    @password = password
  end

  def self.all
    users = DatabaseConnection.query("SELECT * FROM users")
    users.map do |user|
      User.new(
        email: user['email'], 
        id: user['id'],
        password: user['password']
      )
    end
  end

  def self.create(email:, password:)
    user = DatabaseConnection.query("INSERT INTO users (email, password) VALUES ('#{email}', '#{password}') RETURNING id, email, password")
    User.new(
      email: user[0]['email'],
      id: user[0]['id'],
      password: user[0]['password']
    )
  end

end