class User
  attr_reader :user_details, :username

  def initialize(connection: DatabaseConnection.new)
    @user_details = nil
    @username = nil
    @connection = connection
  end

  def log_in(username)
    @username = username
    @user_details = @connection.query('SELECT id, name, email FROM users WHERE '\
      "username = '#{username}';")[0]
  end

  def log_out
    @user_details = @username = nil
  end
end
