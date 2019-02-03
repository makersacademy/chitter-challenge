require 'pg'

class User

  attr_reader :id, :username, :password, :email

  def initialize(id:, username:, password:, email:)
    @id = id
    @username = username
    @email = email
    @password = password
  end

  def self.create(username:, password:, email:)
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'chitter_test'
    else
      con = PG.connect :dbname => 'chitter'
    end
    result = con.exec("INSERT INTO users (username, password, email) VALUES('#{username}', '#{password}', '#{email}') RETURNING id, username, password, email;")
    User.new(id: result[0]['id'], username: result[0]['username'], password: result[0]['password'], email: result[0]['email'])
  end
end
