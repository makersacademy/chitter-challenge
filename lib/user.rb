require 'pg'

# Models a User of Chitter
class User

  def self.id
    @id
  end

  def self.username
    @username
  end

  def self.all_users
    query = DatabaseConnection.query("SELECT * FROM users")
    @users = query.map { |eachquery| User.new(
      eachquery['username'],
      eachquery['email'],
      eachquery['followers'])
    }
  end

  def self.add(u_username, u_email, u_password)
    DatabaseConnection.query("
      INSERT INTO users (username, email, password)
      VALUES('#{u_username}', '#{u_email}', '#{u_password}')")
  end

  def self.sign_in_check(u_email, u_password)
    query = DatabaseConnection.query("
      SELECT COUNT (id) FROM users
      WHERE email = '#{u_email}' AND password = '#{u_password}'")
    query[0]['count'].to_i == 1
  end

  def self.sign_in(u_email, u_password)
    query = DatabaseConnection.query("
      SELECT * FROM users
      WHERE email = '#{u_email}' AND password = '#{u_password}'")
    user(query[0]['id'], query[0]['username'])
  end


  attr_reader :u_name, :email, :followers

  def self.user(id, username)
    @id = id
    @username = username
  end

  def initialize(u_name, email, followers)
    @u_name = u_name
    @email = email
    @followers = followers
  end

end

# Gem Devise
# Industry standard Users. Look into this.
