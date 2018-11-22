require 'pg'
require 'time'

class Users

  def self.register(name, password, username, email)
    query = "('#{name}','#{password}','#{username}','#{email}')"
    sql("INSERT INTO users(name, password, username, email) VALUES #{query} ")
    return true
  end

  def self.get_id(name)
    id = sql("select id from users where username = '#{name}' ")
    return id.map { |id| { id: id['id'] } }.pop[:id].to_i
  end

  def self.login(username, password)
    tuple = sql("SELECT * from users WHERE username = '#{username}' AND password = '#{password}'")
    return tuple.ntuples == 1
  end

  def self.is_a_user?(username)
    tuple = sql("SELECT id from users WHERE username = '#{username}'")
    return tuple.ntuples == 1
  end

  private

  def self.sql(query)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    return connection.exec(query)
  end

end
