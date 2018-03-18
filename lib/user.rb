require_relative './database_connection'

class User

  attr_reader :username

  def initialize(username)
    @username = username
  end

  def self.setup(db_connect = DatabaseConnection)
    @con = db_connect
  end

  def self.sign_in(email, password)
    rs = @con.query("SELECT * FROM users WHERE email = '#{email}'")
    return 'Email address not registered' if not_found?(rs)
    return 'Incorrect password' if wrong_password?(rs, password)
    log_user(rs)
    false
  end

  def self.current_user
    @current_user
  end

  def self.sign_out
    @current_user = nil
  end

  def self.add(fullname, username, email, password)
    @con.query("INSERT INTO users (fullname, username, email, password) "\
    "VALUES ('#{fullname}', '#{username}', '#{email}', '#{password}')")
  end

  private_class_method

  def self.log_user(rs)
    @current_user = User.new(rs[0]['username'])
  end

  def self.not_found?(rs)
    rs.count.zero?
  end

  def self.wrong_password?(rs, password)
    rs[0]['password'] != password
  end
end
