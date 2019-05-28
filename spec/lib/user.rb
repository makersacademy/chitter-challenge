require 'pg'

class User
  attr_reader :id, :name, :username, :email, :password

  def initialize(id:, name:, username:, email:, password:)
    @id = id
    @username = username
    @password = password
    @name = name
    @email = email
  end


  def self.create(id:, name:, username:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO users (username, password, name, email) VALUES('#{username}', '#{password}', '#{name}', '#{email}')RETURNING id, username, password, name, email")
    User.new(id: result[0]['id'], username: result[0]['username'], password: result[0]['password'], name: result[0]['name'], email: result[0]['email'])
  end
end