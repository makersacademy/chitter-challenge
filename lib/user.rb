require 'pg'

class User
  attr_reader :name, :id, :username

  def initialize(id:, name:, username:, password:)
    @id = id
    @name = name
    @username = username
    @password = password
  end

  def self.create(name:, username:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end
    result = connection.exec_params('INSERT INTO peep_users (name, username, password) VALUES($1, $2, $3) RETURNING id, name, username, password;', [name, username, password])
    
    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], password: result[0]['password'])
  end
end