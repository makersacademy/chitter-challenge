require 'pg'

class User
  attr_reader :email, :password, :name, :username

  def initialize(email, password, name, username)
    @email = email
    @password = password
    @name = name
    @username = username
  end

  def ==(user)
    @email == user.email
  end

  def self.all
    result = set_database.exec("SELECT * FROM users")
    result.map {
      |user| User.new(
        user['email'], user['password'], user['name'], user['username']
      )
    }
  end

  def self.create(email, password, name, username)
    result = set_database.exec(
      "INSERT INTO users (email, password, name, username)
      VALUES('#{email}', '#{password}', '#{name}', '#{username}')
      RETURNING email, password, name, username"
    )
    User.new(result.first['email'], result.first['password'],
    result.first['name'], result.first['username'])
  end

  def self.set_database
    ENV['RACK'] == 'test' ?
    PG.connect(
      dbname: 'Chitter_Users_Test') : PG.connect(dbname: 'Chitter_Users'
    )
  end
end
