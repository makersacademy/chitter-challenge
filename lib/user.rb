require_relative 'database_connection'

class User
  attr_reader :id, :username, :email, :password

  def initialize(id, username, email, password)
    @id = id
    @username = username
    @email = email
    @password = password
  end

  def self.create(username, email, password)
    result = DatabaseConnection.exec_params("INSERT INTO users (username, email, password_digest) VALUES ($1, $2, $3) RETURNING id", [username, email, password])
    id = result[0]["id"]
    User.new(id, username, email, password)
  end

  def self.find_by_email(email)
    result = DatabaseConnection.exec_params("SELECT * FROM users WHERE email = $1", [email])
    return nil if result.ntuples == 0
    user_data = result[0]
    User.new(user_data["id"], user_data["username"], user_data["email"], user_data["password_digest"])
  end

  def self.find_by_id(id)
    result = DatabaseConnection.exec_params("SELECT * FROM users WHERE id = $1", [id])
    return nil if result.ntuples == 0
    user_data = result[0]
    User.new(user_data["id"],  user_data["username"], user_data["email"], user_data["password_digest"])
  end
end