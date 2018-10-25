require 'pg'

class User

  attr_reader :email, :password, :name, :username

  def initialize(email, password, name, username)
    @email = email
    @password = password
    @name = name
    @username = username
  end

  def self.sign_up(email, password, name, username)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_manager_test')
    else
      conn = PG.connect(dbname: 'chitter_manager')
    end
    conn.exec("INSERT INTO users (email, password, name, username) VALUES ('#{email}', '#{password}', '#{name}', '#{username}');")
  end

end
