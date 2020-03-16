require 'pg'

class User
  attr_reader :id, :email, :password, :name, :username

  def initialize(id:, email:, password:, name:, username:)
    @id = id
    @email = email
    @password = password
    @name = name
    @username = username
    @user = nil
  end
  def self.create(email:, password:, name:, username:)
    if ENV['ENVIRONMENT'] == 'test'
     connection = PG.connect(dbname: 'chitter_test')
    else
     connection = PG.connect(dbname: 'chitter')
    end
    connection = connection.exec("INSERT INTO users (email, password, name, username) VALUES('#{email}', '#{password}', '#{name}', '#{username}') RETURNING id, email, password, name, username;")
    @user = User.new(id: connection[0]['id'], email: connection[0]['email'], password: connection[0]['password'], name: connection[0]['name'], username: connection[0]['username'])
  end

  def self.instance
    @user
  end



end
