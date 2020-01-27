require_relative 'database_connection'
require_relative 'peep'

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
    DatabaseConnection.setup
    DatabaseConnection.query("INSERT INTO users (username, email, name, password) VALUES ('#{username}', '#{email}', '#{name}', '#{password}')")
  end

  def self.update(parameter:, uid:, data:)
    DatabaseConnection.setup
    DatabaseConnection.query("UPDATE users SET #{parameter} = '#{data}' WHERE uid = #{uid}")
  end

  def peep(msg)
    Peep.create(uid: @uid, msg: msg)
  end

  def self.login(login, password)
    DatabaseConnection.setup
    is_email?(login) ? column = 'email' : column = 'username' 
    check_login_and_password(column, login, password)
  end

  def self.all
    DatabaseConnection.setup
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map { |row| User.new(row) }
  end 

  def self.delete(uid:)
    DatabaseConnection.setup
    DatabaseConnection.query("DELETE FROM peeps WHERE uid = #{uid}")
    DatabaseConnection.query("DELETE FROM users WHERE uid = #{uid}")
  end

  private

  def self.is_email?(email)
    email =~ URI::MailTo::EMAIL_REGEXP
  end

  def self.return_user(column, data)
    DatabaseConnection.query("SELECT * FROM users WHERE #{column} = '#{data}'")
  end

  def self.check_login_and_password(column, login, password)
    user = return_user(column, login)
    user.each do |row| 
      if (row[column] == login && row['password'] == password)
        return User.new(row) 
      else
        return false
      end
    end
  end

end