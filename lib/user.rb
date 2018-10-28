require 'pg'

class User

  attr_reader :name

  def initialize
    @name = name
  end

  def self.name
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'user_test_db')
    else
      connection = PG.connect(dbname: 'user_db')
    end
    result = connection.exec("SELECT name FROM user_db;") #need to change this to chitter in both test and otherwise
    result.map { |name| name['name'] }
  end

  def self.sign_up(name:, username:, email:, password:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'user_test_db')
    else
      connection = PG.connect(dbname: 'user_db')
    end
    connection.exec("INSERT INTO user_db (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}')")
  end
end
