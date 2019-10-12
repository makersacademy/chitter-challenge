require 'pg'

class User

  attr_reader :user_details

  def self.create(name, username, email, password)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    connection.exec("INSERT INTO users (name, username, email, password)
    VALUES('#{name}', '#{username}', '#{email}', '#{password}');")
  end

  def self.login(email, password)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    user = connection.exec("SELECT * FROM users
      WHERE email = '#{email}' AND password = '#{password}';").first
      @user_details = [user["name"], user["username"]]
  end






end
