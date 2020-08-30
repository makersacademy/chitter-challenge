require_relative "database"

class User

  attr_reader :id, :name, :email

  def initialize(id, name, email)
    @id = id
    @name = name
    @email = email
  end

  def self.create(name, email, password)
    DataBase.query("INSERT INTO users (name,email,password) VALUES ('#{name}', '#{email}','#{password}') RETURNING id, name, email;")
  end

  def self.log_in(email, password)
    user = DataBase.query("SELECT id, name, email FROM users WHERE email='#{email}' AND password='#{password}';")
    User.new(user.first["id"], user.first["name"], user.first["email"] )
  end

end