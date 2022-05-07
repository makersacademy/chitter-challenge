require 'pg'

class User
 attr_reader :id, :name, :username :email, :password

  def initialize(id:, name:, username:, email:, password:)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end


  def self.create(name:, username:, email:, password:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect( dbname: 'user_manager_test')
    else
      connection = PG.connect( dbname: 'user_manager')
    end

    result = connection.exec_params("INSERT INTO users (name,username,email,password) VALUES ($1,$2,$3,$4) RETURNING id, name, username, email, password;", [name,username,email,password])
    Peep.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
  end

end
