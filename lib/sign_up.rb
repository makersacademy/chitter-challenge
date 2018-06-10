require 'pg'
require 'bcrypt'

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
    encrypted_password = BCrypt::Password.create(password)
    connection = database_connection
    return false unless unique_username?(username) && unique_email?(email)
    result = insert_into_database(connection, name, username, email, encrypted_password)
    ChitterSignUp.new(result[0]['user_id'], result[0]['name'],
      result[0]['username'], result[0]['email'], result[0]['password'])
  end

  def self.all
    connection = database_connection
    result = connection.exec("SELECT * FROM users")
    result.map do |user|
      ChitterSignUp.new(user['user_id'], user['name'], user['username'],
                        user['email'], user['password'])
    end
  end

  private_class_method

  def self.database_connection
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end

  def self.insert_into_database(connection, name, username, email, password)
    connection.exec(
      "INSERT INTO users (name, username, email, password)
      VALUES ('#{name}', '#{username}', '#{email}', '#{password}')
      RETURNING user_id, name, username, email, password"
    )
  end

  def self.unique_username?(new_username)
    users = ChitterSignUp.all
    usernames = users.map(&:username)
    !usernames.include?(new_username)
  end

  def self.unique_email?(new_email)
    users = ChitterSignUp.all
    emails = users.map(&:email)
    !emails.include?(new_email)
  end
end
