require_relative 'db_connection'

class User
  attr_reader :id, :email, :password, :name, :username

  def self.create(email:, password:, name:, username:)
    result = "INSERT INTO users (email, password, name, username) VALUES('#{email}', '#{password}', '#{name}', '#{username}') RETURNING id, email, password, name, username;"
    User.new(id: result['id'], email: result['email'], password: result[0]['password'], name: result[0]['name'], username: result['username'])
  end

  def initialize(id:, email:, password:, name:, username:)
    @id = id
    @email = email
    @password = password
    @name = name
    @username = username
  end

end
