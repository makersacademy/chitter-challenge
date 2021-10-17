class User
  attr_reader :name

  def initialize(username:)
    @name = username
  end

  def self.create(username:, password:)
    result = DatabaseConnection.query(
      "INSERT INTO userdb
      (username, password) VALUES($1, $2)
      RETURNING username", [username, password]
    )
    User.new(username: result[0]['username'])
  end
  
end
