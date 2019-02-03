require 'pg'
require 'database_connection'

class User

  def self.all
    users = DatabaseConnection.query("SELECT * FROM users;")
    users.map{ |user| User.new(
      name: user['name'],
      email: user['email'],
      password: user['password'],
      id: user['id'])
    }
  end

  def self.add_new(name:, email:, password:)
    created = DatabaseConnection.query("INSERT INTO users(name, email, password)
    VALUES('#{name}', '#{email}', '#{password}')
    RETURNING name, email, password, id;")[0]
    user = User.new(
      name: created['name'],
      email: created['email'],
      password: created['password'],
      id: created['id'])
  end

  # def self.find_user(email)
  #   connection = User.connect
  #   users = connection.exec("SELECT * FROM users WHERE email = #{'email'};")
  #   users.map { |user| User.new(user['name'], user['email'], user['password'], user['id']) }
  # end

    def self.find(id)
      return nil unless id
      result = DatabaseConnection.query("SELECT * FROM users
        WHERE id = #{'id'};")[0]
        User.new(
          name: result['name'],
          email: result['email'],
          password: result['password'],
          id: result['id'])
    end

  attr_reader :name, :email, :password, :id

  def initialize(name:, email:, password:, id:)
    @name = name
    @email = email
    @password = password
    @id = id
  end
end
