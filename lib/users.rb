require 'pg'

class Users
  attr_reader :email, :password, :name, :username

  def initialize(email:, password:, name:, username:)
    @email = email
    @password = password
    @name = name
    @username = username
  end

  def self.create(email:, password:, name:, username:)
    connection = check_environment
    result = connection.exec("INSERT INTO users (email, password, name, username) VALUES ('#{email}', '#{password}', '#{name}', '#{username}') RETURNING email, password, name, username")
    Users.new(email: result[0]['email'], password: result[0]['password'], name: result[0]['name'], username: result[0]['username'])
  end

  def self.check_environment
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end
end
