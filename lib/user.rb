require 'pg'

class User
  attr_reader :username, :email, :password

  def initialize(username:, email:, password:)
    @username = username
    @email = email
    @password = password
  end

  def self.create(username, email, password)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO users (username, email, password) VALUES ('#{username}', '#{email}', #{password})")
    User.new(username, email, password)
  end
end
