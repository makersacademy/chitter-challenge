require 'bcrypt'
require_relative 'database_connection'

class AllChitterUsers

  def initialize(connection: DatabaseConnection, hasher: BCrypt::Password)
    @connection = connection
    @hasher = hasher
  end

  def create(entry_hash)
    case
      when already_taken?(entry_hash)
        'Username or email already in use, please try again'
      when valid_credentials?(entry_hash)
        insert_new_user(entry_hash)
        'You are now signed up to Chitter!'
      else
        'Invalid sign up details, please try again'
    end
  end

  def all
    @connection.query('SELECT name, username, email, password FROM users;')
  end

  def sign_in(username, password)
    user_password_pair = @connection.query("SELECT username, password FROM "\
      "users WHERE username='#{username}';")
    return false if user_password_pair.empty?

    @hasher.new(user_password_pair[0][:password]) == password
  end

  private

  def insert_new_user(entry_hash)
    entry_hash[:password] = @hasher.create(entry_hash[:password])
    @connection.query('INSERT INTO users(name, username, email, password)'\
      " VALUES('#{entry_hash[:name]}', '#{entry_hash[:username]}', "\
      "'#{entry_hash[:email]}', '#{entry_hash[:password]}');")
  end

  def valid_credentials?(entry_hash)
    # This is the step where it would be good to sanitise the inputs to the SQL
    # query.

    # This regexp just checks that there is some text, then an @, then more text
    # then a ., then more text. Which is not a great check for an email.
    entry_hash[:email] =~ /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  end

  def already_taken?(entry_hash)
    !@connection.query("SELECT * FROM users WHERE email = "\
      "'#{entry_hash[:email]}' OR username = "\
      "'#{entry_hash[:username]}';").empty?
  end
end
