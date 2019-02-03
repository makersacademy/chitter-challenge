require 'pg'

class User

  attr_reader :id, :username, :password

  def initialize(id:, username:, password:)
    @id = id
    @username = username
    @password = password
  end

  def self.signup(username:, password:)
    self.connection
    result = connection.exec("INSERT INTO chitter_users (username, password) VALUES('#{username}', '#{password}') RETURNING id, username, password;")
    User.new(id: result[0]['id'], username: result[0]['username'], password: result[0]['password'])
  end


  private

  def self.connection
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_peeps_test')
    else
      connection = PG.connect(dbname: 'chitter_peeps')
    end
  end

end
