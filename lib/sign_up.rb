require 'bcrypt'
require 'database_connection'

class ChitterSignUp

  attr_reader :user_id, :name, :username, :email, :password

  def initialize(user_id, name, username, email, password)
    @user_id = user_id
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def ==(other)
    @user_id == other.user_id
  end

  def self.new_user(name, username, email, password)
    encrypted_password = encrypt_password(password)
    return false unless valid_sign_up?(username, email)
    result = add_to_database(name, username, email, encrypted_password)
    ChitterSignUp.new(result[0]['user_id'], result[0]['name'],
      result[0]['username'], result[0]['email'], result[0]['password'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map do |user|
      ChitterSignUp.new(user['user_id'], user['name'], user['username'],
                        user['email'], user['password'])
    end
  end

  private_class_method

  def self.encrypt_password(password)
    BCrypt::Password.create(password)
  end

  def self.add_to_database(name, username, email, password)
    DatabaseConnection.query(
      "INSERT INTO users (name, username, email, password)
      VALUES ('#{name}', '#{username}', '#{email}', '#{password}')
      RETURNING user_id, name, username, email, password"
    )
  end

  def self.valid_sign_up?(username, email)
    users = ChitterSignUp.all
    usernames = users.map(&:username)
    emails = users.map(&:email)
    !usernames.include?(username) && !emails.include?(email)
  end
end
