require 'uri'

class User

  attr_reader :username, :email, :password, :id

  VALID_EMAIL_REGEX = URI::MailTo::EMAIL_REGEXP

  def self.user_exists?(username)
    users = DatabaseConnection.query('SELECT username FROM users')
    list_of_usernames = users.map { |user_name| user_name['username'] }
    list_of_usernames.include?(username)
  end

  def self.add_user(username, password, email)
    add_query = "INSERT INTO users (username, password, email)
      VALUES ('#{username}', '#{password}', '#{email}')"
    DatabaseConnection.query(add_query)
  end

  def self.find_user(username)
    return false if user_exists?(username) == false

    users = DatabaseConnection.query("SELECT * FROM users WHERE username='#{username}'")
    users_array = users.map { |user| User.new(user['username'], user['email'], user['password'], user['id']) }
    @current_user = users_array[0]
  end

  def self.current_user
    @current_user
  end

  def self.logout
    @current_user = nil
  end

  def self.login_correct?(password)
    password == @current_user.password
  end

  def self.email_dup?(new_email)
    emails = DatabaseConnection.query('SELECT email FROM users')
    list_of_emails = emails.map { |email| email['email'] }
    list_of_emails.include?(new_email)
  end

  def self.email_correct_format?(new_email)
    (new_email =~ VALID_EMAIL_REGEX).nil?
  end

  def initialize(username, email, password, id)
    @id = id
    @username = username
    @email = email
    @password = password
  end

end
