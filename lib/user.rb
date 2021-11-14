require 'pg'

class User 

  attr_reader :id, :username, :password
  
  def initialize(id:, username:, password:)
    @id = id
    @username = username
    @password = password
  end

  def self.add(username:, password:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_users_test')
    else
      connection = PG.connect(dbname: 'chitter_users')
    end
    
    result = connection.exec_params("INSERT INTO users(username, password) VALUES($1, $2) RETURNING id, username, password;", [username, password])
    User.new(id: result[0]['id'], username: result[0]['username'], password: result[0]['password'])
  end
end
