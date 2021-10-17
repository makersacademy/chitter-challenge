class User
  attr_reader :email, :username, :password

  def initialize (email:, username:, password:)
    @email = email
    @username = username
    @password = password
  end  

  def self.all
    users = DatabaseConnection.query("SELECT * FROM users;")

    users.map do |user_hash|
      User.new(email: user_hash['email'], username: user_hash['username'], password: user_hash['password'])

    end
  end

  def self.create(email:, username:, password:)
    user = DatabaseConnection.query(
      "INSERT INTO users(email, username, password) VALUES ($1, $2, $3) RETURNING email, username, password",
       [email, username, password]
    ).first
    User.new(email: user['email'], username: user['username'], password: user['password'])
  end

end