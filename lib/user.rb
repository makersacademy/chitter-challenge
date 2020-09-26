require 'pg'
class User

  def initialize(username, password)
    @username = username
    @password = password
  end

  def self.set_environment
    if   ENV['ENVIRONMENT'] == "test"
        PG.connect(dbname: 'chitter_test')
    else
        PG.connect(dbname: 'chitter')
    end    
  end

  def self.store(username, password)
    set_environment.exec("INSERT INTO chitter_users (username, password) VALUES ('#{username}', '#{password}')")
  end

  def self.user_exists?(username)
    !set_environment.exec("SELECT username FROM chitter_users WHERE username = '#{username}'").num_tuples.zero?

  end

  def self.password?(username, password)
    !set_environment.exec("SELECT username FROM chitter_users WHERE username = '#{username}' AND password = '#{password}'").num_tuples.zero?
  end

  def self.valid_user?(username, password)
    user_exists?(username) && password?(username, password)
  end

  
end