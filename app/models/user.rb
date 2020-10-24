require 'pg'
require_relative 'database_connection'

class User
  attr_reader :username, :email, :name

  def initialize(username:, email:, name:, password:)
    @username = username
    @email = email
    @name = name 
    @password = password
  end

  def self.create(username:, email:, name:, password:)
    if credentials_check(username, email)
      DatabaseConnection.query("INSERT INTO users (username, email, full_name, pwd) 
      VALUES ('kiriarf', 'kiriarf@chitter.com', 'kiril', '123');")
      User.new(username: username, email: email, name: name, password: password)
    else
      nil
    end
  end

  private
  def self.credentials_check(username, email)
    check_email(email) || check_username(username)
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
end
