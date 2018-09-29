class User
  attr_reader :name, :username, :email

  def initialize(connection: DatabaseConnection.new)
    @name = nil
    @username = nil
    @email = nil
    @connection = connection
  end

  def log_in(username)
    @username = username
    user_details = @connection.query('SELECT name, email FROM users WHERE '\
      "username = '#{username}';")[0]
    @name = user_details[:name]
    @email = user_details[:email]
  end

  def log_out
    @name = @username = @email = nil
  end
end
