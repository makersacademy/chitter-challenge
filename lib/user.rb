require 'pg'

class User
  attr_reader :name, :username, :email, :password

  def initialize (name, username, email, password)
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.sql(query)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    connection.exec(query)
  end

  def self.login_details(name, username, email, password)
    result = sql("INSERT INTO users (name, username, email, password)
     VALUES ('#{name}', '#{username}', '#{email}', '#{password}') RETURNING id, name, username, password;")
    User.new(result[0]['id'], result[0]['name'], result[0]['username'], result[0]['password'])
  end

end
