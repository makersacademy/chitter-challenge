require 'pg'

class User

  attr_reader :id, :username, :password, :name, :email

  def initialize(id:, username:, password:, name:, email:)
    @id = id
    @username = username
    @password = password
    @name = name
    @email = email
  end

  def self.signup(username:, password:, name:, email:)
    self.connection
    result = connection.exec("INSERT INTO chitter_users (name, email, username, password) VALUES('#{name}', '#{email}', '#{username}', '#{password}') RETURNING id, name, email, username, password;")
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], username: result[0]['username'], password: result[0]['password'])
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
