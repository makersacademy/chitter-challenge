require_relative 'database_connection'
ENV['RACK_ENV'] = 'test'
class User

  attr_reader :uid, :username, :email, :name, :password

  def initialize(db_row)
    @uid = db_row['uid']
    @username = db_row['username']
    @email = db_row['email']
    @name = db_row['name']
    @password = db_row['password']
  end
  
  def self.create(username:, email:, name:, password:)
    return false unless is_email?(email)
    DatabaseConnection.setup(environment)
    DatabaseConnection.query("INSERT INTO users (username, email, name, password) VALUES ('#{username}', '#{email}', '#{name}', '#{password}')")
  end

  def self.update(parameter:, uid:, data:)
    DatabaseConnection.setup(environment)
    DatabaseConnection.query("UPDATE users SET #{parameter} = '#{data}' WHERE uid = #{uid}")
  end

  def self.all
    DatabaseConnection.setup(environment)
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map { |row| User.new(row) }
  end 

  def self.delete(uid:)
    DatabaseConnection.setup(environment)
    DatabaseConnection.query("DELETE FROM user WHERE uid = #{uid}")
  end

  private

  def self.environment
    ENV['RACK_ENV'] == 'test' ? 'chitter_test' : 'chitter'
  end

  def self.is_email?(email)
    email =~ URI::MailTo::EMAIL_REGEXP
  end
end