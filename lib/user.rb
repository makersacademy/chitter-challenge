# user.rb
class User

  attr_reader :username, :id

  def initialize(id, username)
    @id = id
    @username = username
  end

  def self.signup(name:, email:, password:, username:)
    return :non_unique_email unless unique_email?(email)
    return :non_unique_username unless unique_username?(username)
    sqlquery = "INSERT INTO users(name, email, password, username) VALUES('#{name}', '#{email}', '#{password}', '#{username}') RETURNING id, username;"
    result = DatabaseConnection.query(sqlquery)
    @current_user = User.new(result[0]['id'], result[0]['username'])
  end

  def self.login(email:, password:)
    sqlquery = "SELECT id, username FROM users WHERE email='#{email}' AND password='#{password}';"
    result = DatabaseConnection.query(sqlquery)
    return nil if result.ntuples.zero?
    @current_user = User.new(result[0]['id'], result[0]['username'])
  end

  def self.current_user
    @current_user
  end

  def self.unique_email?(email)
    sqlquery = "SELECT email FROM users WHERE email='#{email}';"
    result = DatabaseConnection.query(sqlquery)
    result.ntuples.zero?
  end

  def self.unique_username?(username)
    sqlquery = "SELECT username FROM users WHERE username='#{username}';"
    result = DatabaseConnection.query(sqlquery)
    result.ntuples.zero?
  end
end
