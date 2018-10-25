require 'pg'

class User

  attr_reader :name, :username, :emailaddress, :password

  def initialize(name:, username:, emailaddress:, password:)
    @name = name
    @username = username
    @emailaddress = emailaddress
    @password = password
  end

  def self.create(name:, username:, emailaddress:, password:)
    @name = name
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_database_test')
    else
      connection = PG.connect(dbname: 'chitter_database')
    end
    result = connection.exec("INSERT INTO users (name, username, emailaddress, password) VALUES('#{name}', '#{username}', '#{emailaddress}', '#{password}') RETURNING name, username, emailaddress, password;")
    User.new(name: result[0]['name'], username: result[0]['username'], emailaddress: result[0]['emailaddress'], password: result[0]['password'])
  end

  def self.name
    @name
  end
end
