class User
  attr_reader :email, :username, :password, :id

  def initialize(id:, email:, username:, password:)
    @email = email
    @username = username
    @password = password
    @id = id
  end  

  def self.all
    users = DatabaseConnection.query("SELECT * FROM users;")
    users.map do |user_hash|
      User.new(id: user_hash['id'], email: user_hash['email'], username: user_hash['username'], 
password: user_hash['password'])
    end
  end

  def self.create(email:, username:, password:)
    user = DatabaseConnection.query(
      "INSERT INTO users(email, username, password) VALUES ($1, $2, $3) RETURNING id, email, username, password",
       [email, username, password]
    ).first
    User.new(id: user['id'], email: user['email'], username: user['username'], 
password: user['password'])
  end

  def self.find(id:)
    return nil unless id
    user = DatabaseConnection.query("SELECT * FROM users WHERE id=$1", [id]).first
    User.new(id: user['id'], email: user['email'], username: user['username'], 
password: user['password'])
  end
end
