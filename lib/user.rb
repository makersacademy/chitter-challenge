require 'pg'
require 'pry'

class User

  attr_reader :username

  def initialize(username:, password:, email:)
    @password = password
    @username = username
    @email = email
  end

  def self.add(username:, password:, email:)
    raise "Username already taken" unless username_available?(username)
    con = connect_to_database
    con.exec("INSERT INTO users (username, password, email)
              VALUES('#{username}', '#{password}', '#{email}')
              RETURNING id, username, password, email")
  end

  def self.username_available?(username)
    con = connect_to_database
    con.exec("SELECT * FROM users WHERE username = '#{username}'").first.nil?
  end

  def self.connect_to_database
    ENV['R ENV'] == "test" ? db = 'chitter_manager_test' : db = 'chitter_manager'
    PG.connect(dbname: db)
  end

  def self.all
    con = connect_to_database
    data = con.exec("SELECT * FROM users")
    data.map { |user| User.new(username: user['username'], password: user['password'], email: user['email']) }
  end

end
