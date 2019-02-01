require 'pg'

class User

  def self.all
    users = DatabaseConnection.query("SELECT * FROM users;")
    users.map{ |user| User.new(user['name'], user['email'], user['password'], user['id'])}
  end

  def self.add_new(name, email, password)
    created = DatabaseConnection.query("INSERT INTO users(name, email, password) VALUES('#{name}', '#{email}', '#{password}') RETURNING name, email, password, id;")[0]
    User.new(created['name'], created['email'],created['password'],created['id'])
  end

  # def self.find_user(email)
  #   connection = User.connect
  #   users = connection.exec("SELECT * FROM users WHERE email = #{'email'};")
  #   users.map { |user| User.new(user['name'], user['email'], user['password'], user['id']) }
  # end

    def self.find(id)
      users = DatabaseConnection.query("SELECT * FROM users WHERE id = #{'id'};")
      users.map { |user| User.new(user['name'], user['email'], user['password'], user['id']) }
    end

  attr_reader :name, :email, :password, :id

  def initialize(name, email, password, id)
    @name = name
    @email = email
    @password = password
    @id = id
  end
end
