require 'bcrypt'
require_relative 'database_connection'

class AllChitterUsers

  def initialize(connection: DatabaseConnection.new, hasher: BCrypt::Password)
    @connection = connection
    @hasher = hasher
  end

  def create(entry_hash)
    return 'in use' if already_taken?(entry_hash)
    insert_new_user(entry_hash) if valid_credentials?(entry_hash)
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

    entry_hash[:email] =~ /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  end

  def already_taken?(entry_hash)
    !@connection.query("SELECT * FROM users WHERE email = "\
      "'#{entry_hash[:email]}' OR username = "\
      "'#{entry_hash[:username]}';").empty?
  end
end
