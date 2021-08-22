require 'bcrypt'
require_relative 'dbconnect'

class User

  attr_reader :id,
              :name,
              :handle,
              :password,
              :email

  def initialize(id, name, handle, password, email)
    @id = id
    @name = name
    @handle = handle
    @password = password
    @email = email
  end

  def self.all
    result = DBConnect.query("SELECT * FROM users")
    result.map do |user| 
      User.new(user['id'], user['name'], user['handle'], user['password'], user['email'])
    end
  end

  def self.create(name, handle, password, email)
    encrypted_password = BCrypt::Password.create(password)
    result = DBConnect.query(query_to_create(name, handle, encrypted_password, email))
    data = ['id', 'name', 'handle', 'password', 'email'].map { |item| result[0][item] }
    @user = User.new(*data)
  end

  def self.instance
    @user
  end

  def self.check_if_unique(name, handle, password, email)
    return :email if User.all.find {|user| user.email == email }
    return :handle if User.all.find {|user| user.handle == "@#{handle}" }
    User.create(name, handle, password, email)
  end

  def self.query_to_create(name, handle, password, email)
    "INSERT INTO users (name, handle, password, email) "\
    "VALUES ('#{name}', '@#{handle}', '#{password}', '#{email}') "\
    "RETURNING id, name, handle, password, email;"
  end

end
