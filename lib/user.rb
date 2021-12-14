require 'pg'
require 'bcrypt'

class User
  attr_reader :email, :password,  :username

  def initialize(email, password, username)
    @email = email
    @password = password
    @username = username
  end

  def self.create(email:, password:, username:)
    encrypted_pwd = BCrypt::Password.create('password')
    rs = DatabaseConnection.query("INSERT INTO users (email, username) VALUES($1, $2) RETURNING  id, email, password, username;")

    User.new(                   # use the data entries (rs) to create a User
      id: rs[0]['id']
      email: rs[0]['email']
      password: rs[0]['password']
      username: rs[0]['username'] # => encrypted_pwd?
    )
  end

end