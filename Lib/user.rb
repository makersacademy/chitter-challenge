require 'pg'

class User
  attr_reader :username

  def initialize(id:, username:, password:)
    @id = id
    @username = username
    @password = password
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_tester')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end
    result = connection.exec("select * from users")
    result.map{|person| User.new(id: person['id'], username: person['username'], password: person['password'])}
  end

  def self.create(username:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_tester')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end
    result = connection.exec("INSERT INTO users (username, password) VALUES ('#{username}', '#{password}') RETURNING username, password;")
    User.new(id: result[0]['id'], username: result[0]['username'], password: result[0]['password'])
  end
end
