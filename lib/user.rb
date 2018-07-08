require 'pg'
require 'bcrypt'


class User
  attr_reader :id, :usename, :name
  def initialize(id, username, name)
    @id = id
    @username = username
    @name = name
  end

  def self.testing
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect(dbname: 'chitter')
    end
end

  def self.all
    User.testing
    result = @connection.exec("SELECT * FROM users")
    result.map { |user| User.new(user['id'], user['username'], user['name']) }
  end

  def self.add(username, name, email, password)
    User.testing
    encrypted_password = BCrypt::Password.create(password)
    result = @connection.exec("INSERT INTO users(username, name, email, password) VALUES ('#{username}', '#{name}', '#{email}', '#{encrypted_password}')
    RETURNING id, username, name")
    User.new(result.first['id'], result.first['username'], result.first['name'])
  end

  def self.authenticate(username, password)
    User.testing
    result = @connection.exec("SELECT * FROM users WHERE username = '#{username}'")
    if result.any?
      if BCrypt::Password.new(result[0]['password']) == password
        return result
      else
        return nil
      end
    end
  end

  def ==(other)
    @id = other.id
  end
end
