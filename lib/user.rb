require_relative 'database_connection'
require 'bcrypt'

class User

  include BCrypt

  attr_reader :username, :name, :email, :id, :password

  def self.create(username, name, email, password)
    password_hash = Password.create(password)
    query = "INSERT INTO users (username, name, email, password) "\
    "VALUES ('#{username}', '#{name}', '#{email}', '#{password_hash}') "\
    "RETURNING id, username, name, email, password;"
    rs = DatabaseConnection.query(query)
    @active_user = User.new(rs[0])
  end

  def self.active
    @active_user
  end

  def self.log_out
    @active_user = nil
  end

  def self.log_in(username, pwd)
    query = "SELECT id, username, name, email, password from users "\
            "WHERE username = '#{username}';"
    rs = DatabaseConnection.query(query)
    return nil if rs.cmd_tuples.zero?
    @active_user = User.new(rs[0]) if Password.new(rs[0]['password']) == pwd
  end

  def initialize(args)
    @id = args['id']
    @username = args['username']
    @name = args['name']
    @email = args['email']
    @password = args['password']
  end
end
