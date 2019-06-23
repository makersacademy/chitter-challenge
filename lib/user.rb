require 'pg'

class User
  attr_reader :name, :username, :email, :psw

  def initialize(name:, username:, email:, psw:)
    @name = name
    @username = username
    @email = email
    @psw = psw
  end

  def self.create(name:, username:, email:, psw:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO users(name, username, email, psw) VALUES('#{name}', '#{username}', '#{email}', '#{psw}') RETURNING id, name, username, email, psw")
    User.new(
      name: result['name'],
      username: result['username'],
      email: result['email'],
      psw: result['psw']
      )
    end
end
