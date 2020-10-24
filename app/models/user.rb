require 'pg'
require_relative 'database_connection'

class User
  attr_reader :id, :username, :email, :name

  def initialize(id:, username:, email:, name:, password:)
    @id = id
    @username = username
    @email = email
    @name = name 
    @password = password
  end

  # def self.find_by(id:)
  #   result = DatabaseConnection.query("SELECT * FROM peeps WHERE id=#{id.to_i};")
  #   result.map do |peep|
  #     Peep.new(
  #       id: peep['id'], 
  #       username: peep['username'], 
  #       body: peep['body'], 
  #       posted_on: peep['posted_on'],
  #       edited_on: peep['edited_on']
  #     )
  #   end.first
  # end

  def self.find_by(id:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id='#{id.to_i}';")
    result.map do |user|
      User.new(
        id: user['id'],
        username: user['username'], 
        email: user['email'], 
        name: user['full_name'], 
        password: user['pwd']
      )
    end.first
  end

  def self.create(username:, email:, name:, password:)
    if credentials_check(username, email)
      DatabaseConnection.query("INSERT INTO users (username, email, full_name, pwd) 
      VALUES ('#{username}', '#{email}', '#{name}', '#{password}');")
      instantiate_user(username)
    else
      nil
    end
  end

  private
  def self.credentials_check(username, email)
    check_email(email) && check_username(username)
  end

  def self.check_email(email)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email='#{email}'")
    check = result.map do |row|
      row['id']
    end.first
    check.nil?
  end

  def self.check_username(username)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username='#{username}'")
    check = result.map do |row|
      row['id']
    end.first
    check.nil?
  end

  def self.instantiate_user(username)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username='#{username}';")
    result.map do |user|
      User.new(
        id: user['id'],
        username: user['username'], 
        email: user['email'], 
        name: user['full_name'], 
        password: user['pwd']
      )
    end.first
  end
end
