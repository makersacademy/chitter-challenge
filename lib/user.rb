require 'pg'
require_relative './database.rb'

class User

  attr_reader :id, :name, :email, :username, :password, :signin

  def initialize(options)
    @id = options[:id]
    @name = options[:name]
    @email = options[:email]
    @username = options[:username]
    @password = options[:password]
  end

  def self.create(options)
    con = Database::connect
    con.exec "INSERT INTO users (name, email, username, password) VALUES ('#{options[:name]}', '#{options[:email]}', '#{options[:username]}', '#{options[:password]}')"
  end

  def self.all
    con = Database::connect
    con.exec('SELECT * FROM users').map do |user|
      User.new(
        id: user['id'],
        name: user['name'],
        email: user['email'],
        username: user['username'],
        password: user['password'],
      )
    end
  end

  def self.signin(username, password)
    con = Database::connect
    row = con.exec "SELECT * from users"
    if row.column_values(3).include?(username)
      re = con.exec("SELECT * FROM users WHERE username = '#{username}'")
      a = re.to_a
      if a[0]['password'] == password
        re.map do |user|
          @current_user = User.new(
          id: user['id'],
          name: user['name'],
          email: user['email'],
          username: user['username'],
          password: user['password'],
        )
        end
      else
        return false
      end
    else
      return false
    end
  end

  def self.signout
    @current_user = nil
  end

  # def self.current_signin?
  #   @signin
  # end

  def self.current_user
    @current_user
  end

end
