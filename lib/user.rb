class User

  attr_reader :username, :email, :password

  def self.user_exists?(username)
    users = DatabaseConnection.query('SELECT username FROM users')
    list_of_usernames = users.map { |user_name| user_name['username'] }
    list_of_usernames.include?(username)
  end

  def self.add_user(username, password, email)
    DatabaseConnection.query("INSERT INTO users (username, password, email) VALUES ('#{username}', '#{password}', '#{email}')")
  end

  def self.find_user(username)
    return false if user_exists?(username) == false

    users = DatabaseConnection.query("SELECT * FROM users WHERE username='#{username}'")
    users_array = users.map { |user| User.new(user['username'], user['email'], user['password']) }
      @current_user = users_array[0]
  end

  def self.login_correct?(password)
    password == @current_user.password
  end

  def initialize(username, email, password)
    @username = username
    @email = email
    @password = password
  end

end
