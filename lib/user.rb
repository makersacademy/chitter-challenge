require_relative 'db_connection'

class User

  attr_reader :id, :name, :username, :email, :password
  attr_accessor :logged_in

  def initialize(id, name, username, email, password)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
    @logged_in = false
  end

  def self.all
    users_array = []
    response = DatabaseConnection.query("SELECT * FROM users")
    response.each do |user|
      users_array << User.new(user['id'], user['name'], user['username'], user['email'], user['password'])
    end
    users_array
  end

  def self.add(name, username, email, password)
    DatabaseConnection.query("INSERT INTO users (name, username, password, email) VALUES ('#{name}', '#{username}', '#{password}', '#{email}')")
  end

  def self.find_by_id(id)
    user = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(user[0]['id'], user[0]['name'], user[0]['username'], user[0]['email'], user[0]['password'])
  end

  def self.find_by_username(username)
    user = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}'")
    User.new(user[0]['id'], user[0]['name'], user[0]['username'], user[0]['email'], user[0]['password'])
  end

  def self.user_exists?(username)
    user = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}'")
    if user.first == nil
      false
    else
      true
    end
  end

  def self.email_exists?(email)
    user = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    if user.first == nil
      false
    else
      true
    end
  end

end
