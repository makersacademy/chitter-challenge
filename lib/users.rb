require 'pg'
require 'time'

class Users

  attr_reader :id, :name, :username, :email

  def initialize(id, name, username, email)
    @id = id
    @name = name
    @username = username
    @email = email
  end

  def self.register(name, password, username, email)
    query = "('#{name}','#{password}','#{username}','#{email}')"
    sql("INSERT INTO users(name, password, username, email) VALUES #{query} ")
    return true
  end

  def self.user_with_id(id)
    begin
      user = sql("SELECT * from users WHERE id = #{id}")
      user = Users.new(user[0]["id"], user[0]["name"], user[0]["username"], user[0]["email"])
    rescue
      return false
    end
    return user
  end

  def self.user_with_name(name)
    begin
      user = sql("SELECT * from users WHERE username = '#{name}'")
      user = Users.new(user[0]["id"], user[0]["name"], user[0]["username"], user[0]["email"])
    rescue
      return false
    end
    return user
  end

  def self.get_id(name)
    begin
      id = sql("select id from users where username = '#{name}' ")
      return id.map { |id| { id: id['id'] } }.pop[:id].to_i
    rescue
      return false
    end
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
