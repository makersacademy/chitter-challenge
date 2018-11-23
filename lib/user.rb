require 'pg'

class User

  attr_reader :username, :password

  def initialize(username, password)
    @username = username
    @password = password
  end

  def self.all_users
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end
    result = connection.exec("SELECT username, password FROM users ORDER BY username ASC;")
    result.map { |user| User.new(user['username'], user['password']) }
  end

  def self.create_user(username, password)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end
    connection.exec("INSERT INTO users (username, password) VALUES('#{username}', '#{password}')")
  end
end
