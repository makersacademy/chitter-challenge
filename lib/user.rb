require 'pg'

class User
  attr_reader :id, :username, :name, :email, :password

  def initialize(id:, username:, name:, email:, password:)
    @id = id
    @username = username
    @name = name
    @email = email
    @password = password
  end

  def self.create(username:, name:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec_params(
      "INSERT INTO users (username, name, email, password) VALUES($1, $2, $3, $4) RETURNING id, username, email, password, name;", [username, name, email, password]
    )
    User.new(id: result[0]['id'], username: result[0]['username'], name: result[0]['name'], email: result[0]['email'], password: result[0]['password'])
  end

  def self.find(user)
    return nil unless user
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM users WHERE id = $1", [user.id])
    new_user = User.new(id: result[0]['id'], username: result[0]['username'], name: result[0]['name'], email: result[0]['email'], password: result[0]['password'])
    return new_user
  end
end