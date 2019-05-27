require 'pg'
class User
  attr_reader :id, :name, :username, :email

  def initialize(id:, name:, username:, email:)
    @id = id
    @name = name
    @username = username
    @email = email
  end

  def self.create(name:, username:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_manager_test')
    else
      con = PG.connect(dbname: 'chitter_manager')
    end

    result = con.exec("INSERT INTO users (name, username, email, password)
    Values ('#{name}', '#{username}','#{email}', '#{password}')
    RETURNING id, name, username, email, password;")
    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'],
      email: result[0]['email'])

  end

  def self.find(email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    find = connection.exec("SELECT name, username FROM users WHERE email = '#{email}' AND password = '#{password}';")
    find.first
  end

end
