require_relative 'db_connection'

class User
  extend DbConnection
  attr_reader :id, :email, :password, :user_name

  def initialize(id, email, password, name)
    @id = id
    @email = email
    @password = password
    @user_name = name
  end

  def self.create(user_name:, email:, password:)
    connection.exec("INSERT INTO users (user_name, email, password) VALUES('#{user_name}', '#{email}', '#{password}')")
  end

  def self.all
    @result = connection.exec("SELECT * FROM users;")
    return @result.to_a
  end

  def self.login
  end

  def self.find(id)
    result = connection.exec("SELECT * FROM users WHERE id = '#{id}'")
    User.new(result[0]['id'], result[0]['email'], result[0]['password'], result[0]['name'])
  end
end
