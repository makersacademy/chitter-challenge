require 'pg'
require_relative './database.rb'

class User

  attr_reader :id, :name, :email, :username, :password

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

end
