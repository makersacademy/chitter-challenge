require 'pg'
require_relative './peep'

class User

  attr_reader :id, :name, :username, :email

  def initialize(id, name, username, email)
    @id = id
    @name = name
    @username = username
    @email = email
  end

  def self.create(name, username, email, password)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    return false if invalid?(username)
    result = connection.exec("INSERT INTO users (name, username, email, password) VALUES('#{name}','#{username}','#{email}','#{password}') RETURNING id, name, username, Email")
    User.new(result.first['id'], result.first['name'], result.first['username'], result.first['email'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    result = connection.exec("SELECT * FROM users")
    result.map { |user| User.new(user['id'], user['name'], user['username'], user['email']) }
  end

  def self.invalid?(username)
    users = User.all
    usernames = users.map { |user| user.username }
    usernames.include?(username)
  end

end
