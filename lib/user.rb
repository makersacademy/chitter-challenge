require 'pg'

class User


  attr_reader :id, :username, :password

  def initialize(id:, username:, password:)

    @id = id
    @username = username
    @password = password

  end

  def self.create_user(username:, password:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
      else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO users (username, password) VALUES('#{username}', '#{password}') RETURNING id, username, password")
    user = User.new(id: result[0]['id'], username: result[0]['username'], password: result[0]['password'])
    return user

  end

  def self.check_password(username:, password:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
      else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM users WHERE username='#{username}';")
    user_check = User.new(id: result[0]['id'], username: result[0]['username'], password: result[0]['password'])

    if user_check.password == password
      return true
    else
      return false
    end

  end

  def self.find_user(username:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    user_exists = connection.exec("SELECT count(*) FROM users WHERE username = '#{username}';")

    user_exists.each do |output|
      output.each do |key, value|
        if value == "0"
          return false
        else
          return true
        end
      end
    end
  end

end
