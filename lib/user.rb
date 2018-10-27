require 'pg'
require 'pry'

class User

  attr_reader :username, :current_user

  def initialize(username:, password:, email:)
    @password = password
    @username = username
    @email = email
  end

  def self.add(username:, password:, email:)
    availability_checks(username, email)
    con = connect_to_database
    con.exec("INSERT INTO users (username, password, email)
              VALUES('#{username}', '#{password}', '#{email}')
              RETURNING id, username, password, email")
  end

  def self.all
    con = connect_to_database
    data = con.exec("SELECT * FROM users")
    data.map do |user| User.new(username: user['username'],
                              password: user['password'],
                              email: user['email'])
    end
  end

  def self.authenticate(username:, password:)
    con = connect_to_database
    user_data = con.exec("SELECT * FROM users
                          WHERE username = '#{username}'"
                         ).first
    return false if user_data.nil?
    user_data['password'] == password
  end

  private_class_method

  def self.availability_checks(username, email)
    raise "Username already taken" unless username_available?(username)
    raise "Email already taken" unless email_available?(email)
  end

  def self.username_available?(username)
    con = connect_to_database
    con.exec("SELECT * FROM users WHERE username = '#{username}'").first.nil?
  end

  def self.email_available?(email)
    con = connect_to_database
    con.exec("SELECT * FROM users WHERE email = '#{email}'").first.nil?
  end

  def self.connect_to_database
    db = ENV['R ENV'] == "test" ? 'chitter_manager_test' : 'chitter_manager'
    PG.connect(dbname: db)
  end

end
