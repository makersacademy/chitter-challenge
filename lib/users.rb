require 'pg'
require 'bcrypt'

class DetailsAlreadyExist < StandardError
  attr_reader :message, :field
  def initialize(value)
    @field = value
    if value == "username"
      @message = "Username Already Taken"
    elsif value == "email"
      @message = "Account with email address already exists"
    else
      @message = "Unknown error value"
    end
    super(@message)
  end
end

class InvalidEmail < StandardError
  attr_reader :message, :field
  def initialize(email)
    @field = "email"
    @message = "#{email} is not a valid email"
    super(@message)
  end
end

class User

  attr_reader :email, :password, :username, :screenname

  def initialize email:, password:, username:, screenname:
    @email = email
    @password = password
    @username = username
    @screenname = screenname
    
  end

  class << self
    def create email:, password:, username:, screenname:
      check_details(email: email, username: username)
      connection = make_connection()
      encrypted_password = BCrypt::Password.create(password)
      result = connection.exec("INSERT INTO users (email, password, username, screenname) VALUES ('#{email}', '#{encrypted_password}', '#{username}', '#{screenname}') RETURNING email, password, username, screenname;")
      User.new(email: result[0]['email'], password: result[0]['encrypted_password'], username: result[0]['username'], screenname: result[0]['screenname'])
    end

    def check_login userID:, password:
      connection = make_connection()
      pass = false
      if userID.match? /(\A\S+@\S+.[a-zA-Z]{2,}\z)/
        if check_email(connection: connection, email: userID) == false
          puts "bad email: #{userID}"
          return false
        end
        result = connection.exec("SELECT * FROM users WHERE email='#{userID}';")
      else
        if check_username(connection: connection, username: userID) == false
          puts "bad username: #{userID}"
          return false 
        end
        result = connection.exec("SELECT * FROM users WHERE username='#{userID}';")
      end
      if BCrypt::Password.new(result[0]['password']) == password
        return result
      else
        puts "bad password: #{password}"
        return false
      end
    end

    private

    def check_details(email:, username:)
      regex_email(email)
      connection = make_connection()
      raise DetailsAlreadyExist.new("username") if check_username(connection: connection, username: username)
      raise DetailsAlreadyExist.new("email") if check_email(connection: connection, email: email)
    end

    def check_username(connection:, username:)
      connection.exec("SELECT * FROM users WHERE username='#{username}';").cmd_tuples > 0
    end

    def check_email(connection:, email:)
      connection.exec("SELECT * FROM users WHERE email='#{email}';").cmd_tuples > 0
    end

    def regex_email(email)
      match = email.match(/(\A(\w+[-_.]?\w+)*@(\w+[-_.]?)*\w+([.][a-z]{2,}\z))/) # it's fairly obvious what this does, so I won't bother explaining it
      if match == nil or match[0] != email 
        raise InvalidEmail.new(email)
      end
    end

    def make_connection
      if ENV['ENVIRONMENT'] == 'test'
        return PG.connect(dbname: 'chitter_database_test')
      else
        return PG.connect(dbname: 'chitter')
      end
    end
  end
end