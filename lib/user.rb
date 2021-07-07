require_relative './database_connection'
require_relative './peep'

class User

  attr_reader :name, :username, :email, :id

  def initialize(name:, username:, email:, password:, id:)
    @name = name
    @username = username
    @email = email
    @password = password
    @id = id
  end

  def self.create(name:, username:, email:, password:)
    DatabaseConnection.query("INSERT INTO users(name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}')")
  end

  def self.all
    res = DatabaseConnection.query("SELECT * FROM users")
    res.map do |user|
      new(name: user['name'], username: user['username'], email: user['email'], password: user['password'], id: user['id'])
    end
  end

  def self.find(username:,email:)
    res = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    res.map do |user|
      new(name: user['name'], username: user['username'], email: user['email'], password: user['password'], id: user['id'])
    end.pop
  end

  def peeps
    res = DatabaseConnection.query("SELECT * FROM peeps WHERE user_id = #{@id}")
    res.map do |peep|
      Peep.new(message: peep['message'], time: peep['time'], user_id: peep['user_id'], user_name: peep['user_name'])
    end
  end
end
