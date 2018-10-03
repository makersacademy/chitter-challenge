require 'bcrypt'

class Users

  def self.create(name,username,email,password)
    return false if Users.exists?(username,email)
    pw_encrypt = BCrypt::Password.create(password)
    user = DatabaseConnection.exec("INSERT INTO users (name,username,email, password) VALUES('#{name}', '#{username}','#{email}', '#{pw_encrypt}') RETURNING id, name, username, email")
    Users.new(user[0]['id'],user[0]['name'],user[0]['username'],user[0]['email'])
  end

  def self.authenticate(email,password)
    user = DatabaseConnection.exec("SELECT * FROM users WHERE email='#{email}'")
    return "User does not exist" if user.ntuples == 0
    return "Wrong password" if BCrypt::Password.new(user[0]['password']) != password
    return Users.new(user[0]['id'],user[0]['name'],user[0]['username'],user[0]['email'])
  end


  def self.exists?(username,email)
    result_username = DatabaseConnection.exec("SELECT * FROM users WHERE username='#{username}'")
    result_email = DatabaseConnection.exec("SELECT * FROM users WHERE email='#{email}'")
    return true if (result_username.ntuples > 0 || result_email.ntuples > 0)
    return false
  end

  def initialize(id,name,username,email)
    @id = id
    @name = name
    @username = username
    @email = email
  end

  attr_reader :id, :email, :name, :username
end
