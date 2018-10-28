require 'pg'

class User

  attr_reader :name, :username, :emailaddress, :password

  def initialize(name:, username:, emailaddress:, password:)
    @name = name
    @username = username
    @emailaddress = emailaddress
    @password = password
  end

  def self.create(name:, username:, emailaddress:, password:)
    @name = name
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_database_test')
    else
      connection = PG.connect(dbname: 'chitter_database')
    end
    result = connection.exec("INSERT INTO users (name, username, emailaddress, password) VALUES('#{name}', '#{username}', '#{emailaddress}', '#{password}') RETURNING name, username, emailaddress, password;")
    User.new(name: result[0]['name'], username: result[0]['username'], emailaddress: result[0]['emailaddress'], password: result[0]['password'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_database_test')
    else
      connection = PG.connect(dbname: 'chitter_database')
    end
    result = connection.exec("SELECT * FROM users")
    result.map do |user|
      User.new(name: user['name'], username: user['username'], emailaddress: user['emailaddress'], password: user['password'])
    end
  end

  def self.name
    @name
  end

  def self.password_authentication(username, password)
    user = User.find_username(username)
    password == user.password
  end

  def self.find_username(username)
    User.all.each do |user|
      if user.username == username
        return user
      end
    end
  end

  def self.unique_check(username, emailaddress)
    User.all.each do |user|
      return false if user.username == username
      return false if user.emailaddress == emailaddress
    end
  end

  def self.find(column:, value:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_database_test')
    else
      connection = PG.connect(dbname: 'chitter_database')
    end
    return nil if column.nil?
      result = connection.exec("SELECT * FROM users WHERE #{column} = '#{value}'")
    return nil if result.nil?
    User.new(
      # id: result[0]['id'],
      name: result[0]['name'],
      username: result[0]['username'],
      emailaddress: result[0]['emailaddress'],
      password: result[0]['password']
    )
  end
end
