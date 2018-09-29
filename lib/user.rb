require 'pg'

class User
  attr_reader :id, :name, :username, :email, :password

  def initialize(id: ,name:, username:, email:, password:)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.create(name:, username:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peeps_test')
    else
      connection = PG.connect(dbname: 'peeps_manager')
    end
    result = connection.exec ("INSERT INTO users (name, username, email, password) VALUES('#{name}','#{username}','#{email}', '#{password}') RETURNING user_id, name, username, email, password;")
    User.new(id: result[0]['user_id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
  end


end
