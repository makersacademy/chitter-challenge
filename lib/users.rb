require 'pg'
# require 'user'

class Users

  def self.create(name, username, email, password, connection = connect)
    connection.exec("INSERT INTO users(name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}')")
  end

  private

  def self.connect
    if ENV['RACK_ENV'] == 'test'
      PG.connect :dbname => 'chitter_test'
    else
      PG.connect :dbname => 'chitter'
    end
  end
end
