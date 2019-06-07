require 'pg'

class User

  attr_reader :name, :username, :email
  
  def initialize(id:, name:, username:, email:)
    @id = id
    @name = name
    @email = email
    @username = username
  end

  def self.all 
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM users")
    result.map do |user|
      User.new(id: user['id'], name: user['name'], username: user['username'], email: user['email'])
    end
  end

  def self.create(name:, username:, email:, password:)
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("INSERT INTO users (username, name, email, password) VALUES('#{username}', '#{name}', '#{email}', '#{password}') RETURNING id, username, name, email;")
    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], email: result[0][:email])
  end
end