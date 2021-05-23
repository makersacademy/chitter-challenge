require 'bcrypt'
require_relative 'database_connection'


class User

  attr_reader :id, :name, :username, :email

  def initialize(id:, name:, username:, email:)
    @id = id
    @name = name
    @username = username
    @email = email
  end

  def self.create(name:, username:, email:, password:)

    encrypted_password = BCrypt::Password.create(password)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter-app')
    end
    result = connection.exec("INSERT INTO users (name, username, email, password) VALUES('#{name}', '#{username}','#{email}', '#{encrypted_password}') RETURNING id, name, username, email;")
    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'])
  end

  def self.find(user_id)
    return nil unless user_id

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test') 
    else
      connection = PG.connect(dbname: 'chitter-app')
    end

    result =  connection.exec("SELECT * FROM users WHERE id = #{user_id};").first
    User.new(id: result["id"], name: result["name"], username: result["username"], email: result["email"])
  end

  def self.authenticate(username:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test') 
    else
      connection = PG.connect(dbname: 'chitter-app')
    end
    result = connection.exec("SELECT * FROM users WHERE username = '#{username}';")
    return unless result.any?
    # return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'])
  end
  
end