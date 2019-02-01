require 'pg'

class User

  def self.connect_to_database
    ENV['ENVIRONMENT'] == 'test' ? db = 'chitter_db_test' : db = 'chitter_db'
    @conn = PG.connect(dbname: db)
  end

  def self.all_users

    query = DatabaseConnection.query("SELECT * FROM users")
    @users = query.map { |eachquery| User.new(eachquery['email'], eachquery['password'])}
  end

  def self.add(u_email, u_password)
    DatabaseConnection.query("INSERT INTO users (email, password) VALUES('#{u_email}', '#{u_password}')")
  end

  def self.sign_in(u_email, u_password)
    @query = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{u_email}' AND password = '#{u_password}'")
  end

  def self.email_check(u_email)
    u_email == @query[0]['email']? true : false
  end

  def self.password_check(u_password)
    u_password == @query[0]['password']? true : false
  end

  def self.sign_in_check(u_email, u_password)
    email_check(u_email)
    password_check(u_password)
  end

  attr_reader :email, :password
  def initialize(email, password)
    @email = email
    @password = password
  end

end

# def self.sign_in_check(email, password)
#     result = DatabaseConnection.query("SELECT COUNT(user_id) FROM users WHERE email = '#{email}' AND password = '#{password}';")
#     result[0]['count'].to_i == 1 ? true : false
#   end

# Gem Devise
# Industry standard Users. Look into this.
