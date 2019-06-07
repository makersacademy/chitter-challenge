require 'pg'

class User
  attr_reader :username, :name

  def initialize(username, name = "")
    @username = username
    @name = name;
  end

  def self.register(name, username, password)
    connection = ENV["ENVIRONMENMT"] == "test" ? PG.connect(dbname: 'chitter_test') : PG.connect(dbname: 'chitter')
    connection.exec("insert into users (name, username, password) values ('#{name}', '#{username}', '#{password}');")
  end

  def self.get_user(username)
    connection = ENV["ENVIRONMENMT"] == "test" ? PG.connect(dbname: 'chitter_test') : PG.connect(dbname: 'chitter')
    result = connection.exec("select name, username from users where username = '#{username}';")
    result.map { |user| User.new(user['username'], user['name']) }
  end

end
