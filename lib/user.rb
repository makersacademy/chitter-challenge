require 'bcrypt'
require 'pg'
require_relative './database.rb'

class User

  include BCrypt

  attr_reader :id, :name, :email, :username, :password_hash

  def initialize(options)
    @id = options[:id]
    @name = options[:name]
    @email = options[:email]
    @username = options[:username]
    @password_hash = BCrypt::Password.new(options[:password])
  end

  def self.create(options)
    hashed_password = BCrypt::Password.create(options[:password])
    user = User.new(
            id: options[:id],
            name: options[:name],
            email: options[:email],
            username: options[:username],
            password: hashed_password,
           )
    self.add(user)
    user
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

  def self.authenticate(username, password)
    user = self.find_by_username(username)
    user != nil && user.password_hash == password ? user : nil
  end

  private

  def self.add(user)
    con = Database::connect
    con.exec "INSERT INTO users (name, email, username, password) VALUES ('#{user.name}', '#{user.email}', '#{user.username}', '#{user.password_hash}')"
  end

  def self.find_by_username(username)
    query = "PREPARE get_users (text) AS SELECT * FROM users WHERE username = ($1);"
    query += "EXECUTE get_users('#{username}')"
    con = Database::connect
    re = con.exec(query).to_a
    re.length > 0 ? self.initialize_user(re[0]) : nil;
  end

  def self.initialize_user(result)
    begin
      User.new(id: result["id"], name: result["name"], email:  result["email"], username: result["username"], password: result["password"])
    rescue
      nil
    end
  end

end
