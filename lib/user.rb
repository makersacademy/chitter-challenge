require 'pg'

class User
  attr_reader :id, :name, :username, :email, :psw

  def initialize(name:, username:, email:, psw:)
    @id = id
    @name = name
    @username = username
    @email = email
    @psw = password
  end

  def self.create(id:, name:, username:, email:, psw:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO users (name, username, email, psw) VALUES('#{name}', '#{username}', '#{email}', '#{psw}')RETURNING id, name, username, email, psw")
    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'], psw: result[0]['psw'])
  end
end
