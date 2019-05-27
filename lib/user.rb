require 'pg'

class User

  attr_reader :email, :password, :name, :username

  def initialize(email, password, name, username)
    @email = email
    @password = password
    @name = name
    @username = username
  end


  def add
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO users (email, password, name, username) VALUES('#{@email}', '#{@password}', '#{@name}', '#{@username}') RETURNING email, password, name, username;")
  end
end
