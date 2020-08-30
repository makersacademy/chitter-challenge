require_relative "database"

class User

  attr_reader :id, :name, :email

  def initialize(id, name, email)
    @id = id
    @name = name
    @email = email
  end

  def self.create(name, email, password)
    return "This email is already registered" unless email_check(email)

    user = DataBase.query("INSERT INTO users (name,email,password) VALUES ('#{name}', '#{email}','#{password}') RETURNING id, name, email;")
    User.new(user.first["id"], user.first["name"], user.first["email"] )
  end

  def self.log_in(email, password)
    return "Email Error" if email_check(email)
    return "Incorrect password" if password_check(password)

    user = DataBase.query("SELECT id, name, email FROM users WHERE email='#{email}' AND password='#{password}';")

    User.new(user.first["id"], user.first["name"], user.first["email"] )
  end

  private 
  
  def self.email_check(email)
    user = DataBase.query("SELECT email FROM users WHERE email='#{email}';")
    user.first.nil?
  end

  def self.password_check(password)
    user = DataBase.query("SELECT password FROM users WHERE password='#{password}';")
    user.first.nil?
  end

end