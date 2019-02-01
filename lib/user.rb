require 'pg'

class User

  def self.connect_to_database
    ENV['ENVIRONMENT'] == 'test' ? db = 'chitter_db_test' : db = 'chitter_db'
    @conn = PG.connect(dbname: db)
  end

  def self.all_users
    query = DatabaseConnection.query("SELECT * FROM users")
    @users = query.map { |eachquery| User.new(eachquery['username'], eachquery['email'])}
  end

  def self.add(u_username, u_email, u_password)
    DatabaseConnection.query("INSERT INTO users (username, email, password) VALUES('#{u_username}', '#{u_email}', '#{u_password}')")
  end

  # def self.sign_in(u_email, u_password)
  #   @query = DatabaseConnection.query("SELECT COUNT (id) FROM users WHERE email = '#{u_email}' AND password = '#{u_password}'")
  # end

  def self.sign_in_check(u_email, u_password)
    query = DatabaseConnection.query("SELECT COUNT (id) FROM users WHERE email = '#{u_email}' AND password = '#{u_password}'")
    query[0]['count'].to_i == 1 ? true : false
  end

  attr_reader :username, :email

  def initialize(username, email)
    @username = username
    @email = email
  end

end

# Gem Devise
# Industry standard Users. Look into this.
