require 'pg'

class User

  attr_reader :id, :username

  def initialize(id:, username:)
    @id = id
    @username = username
  end

  def self.create(fullname:, username:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter_app')
    end

    result = connection.exec("INSERT INTO users (fullname, username, email, password) VALUES('#{fullname}', '#{username}', '#{email}', '#{password}') RETURNING id, username;")
    User.new(id: result[0]['id'], username: result[0]['username'])
  end

  def self.find(id:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter_app')
    end

    return nil unless id
    result = connection.exec("SELECT * FROM users WHERE id = #{id}")
    User.new(id: result[0]['id'], username: result[0]['username'])
  end

end
