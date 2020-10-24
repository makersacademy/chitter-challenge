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
    check1 = DatabaseConnection.query("SELECT * FROM users WHERE username='#{username}'")
    check2 = DatabaseConnection.query("SELECT * FROM users WHERE email='#{email}'")

    check1 = check1.map do |row|
      row['id']
    end.first

    check2 = check2.map do |row|
      row['id']
    end.first

    puts check1
    puts check2

    if !check1 || !check2
      DatabaseConnection.query("INSERT INTO users (username, email, full_name, pwd) 
      VALUES ('kiriarf', 'kiriarf@chitter.com', 'kiril', '123');")
      User.new(username: username, email: email, name: name, password: password)
    else
      nil
    end
  end

end