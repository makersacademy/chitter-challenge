require 'bcrypt'

class User

  attr_reader :id, :name, :username, :email, :password

  def initialize(id, name, username, email, password)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.create(name, username, email, password)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (name, username, email, password)
     VALUES($1, $2, $3, $4)
     RETURNING id, name, username, email, password",
    [name, username, email, encrypted_password])
    User.wrap(result)
  end

  def self.find_id(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id=$1;", [id])
    User.wrap(result)
  end

  def self.wrap(result)
    User.new(result[0]["id"], result[0]["name"], result[0]["username"],
             result[0]["email"], result[0]["password"])
  end

  def self.username_exists?(username)
    result = DatabaseConnection.query("SELECT exists (SELECT 1 FROM users WHERE username = $1 LIMIT 1);", [username])
    result[0]["exists"] == "t"
  end

  def self.email_exists?(email)
    result = DatabaseConnection.query("SELECT exists (SELECT 1 FROM users WHERE email = $1 LIMIT 1);", [email])
    result[0]["exists"] == "t"
  end

  def self.find_email(email)
    return nil unless User.email_exists?(email)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email=$1;", [email])
    User.wrap(result)
  end

  def self.authenticate(email, password)
    user = User.find_email(email)
    if user == nil
      return nil
    elsif BCrypt::Password.new(user.password) == password
      return user
    else
      return nil
    end    
  end

end
