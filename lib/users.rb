require 'pg'
require_relative 'user'

class Users

  def self.all(user_class = User, connection = connect)
    users = connection.exec("SELECT * FROM users;")
    users.map { |user| user_class.new(user['name'], user['username'], user['email'], user['password'])}
  end

  def self.create(name, username, email, password, connection = connect)
    return false unless username_available?(username)
    connection.exec("INSERT INTO users(name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}')")
  end

  private

  def self.connect
    if ENV['RACK_ENV'] == 'test'
      PG.connect :dbname => 'chitter_test'
    else
      PG.connect :dbname => 'chitter'
    end
  end

  def self.username_available?(username, connection = connect)
    all.each do |user|
      return false if user.username == username
    end
  end
end
