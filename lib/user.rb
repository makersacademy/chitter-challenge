class User
  
  attr_reader :id, :username

  def initialize(id:, username:)
    @id = id
    @username = username
  end

  def self.signup(firstname:, lastname:, email:, password:, username:)
    result = DatabaseConnection.query(
      "INSERT INTO users (first_name, last_name, email, username, password) 
      VALUES ('#{firstname}', '#{lastname}', '#{email}', '#{username}', '#{password}')
      RETURNING id, username"
    )
    User.new(
      id: result[0]["id"], 
      username: result[0]["username"]
      )
  end
end
