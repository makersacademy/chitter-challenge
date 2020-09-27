require 'pg'
require_relative './database_connection.rb'

class Users

  attr_reader :id, :name, :email, :password, :username

  def initialize(id:, name:, email:, password:, username:)
    @id = id
    @name = name
    @password = password
    @username = username
  end

  def self.create(name:, email:, password:, username:)
    Users.set_environment

    @connection = DatabaseConnection.connection

    result = DatabaseConnection.query("INSERT INTO users (name, email, password, username) VALUES('#{name}', '#{email}', crypt('#{password}', gen_salt('bf')), '#{username}') RETURNING id, name, email, password, username;")
    
    Users.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], password: result[0]['password'], username: result[0]['username'])
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id}")
    
    Users.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], password: result[0]['password'], username: result[0]['username'])
  end

  def self.all
    Users.set_environment

    result = DatabaseConnection.query("SELECT * FROM users")

    result.map { |user| 
      Users.new(
        id: user['id'],
        email: user['email'],
        name: user['name'],
        password: user['password'],
        username: user['name']
      )
    }
  end

  def self.where(user_id)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{user_id};")

    #result.map { }
  end

  def self.authenticate(username:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}' AND password = crypt('#{password}', password);")

    user = result.map { |user| 
      Users.new(
        id: user['id'],
        email: user['email'],
        name: user['name'],
        password: user['password'],
        username: user['name']
      )
    }
    user[0]
  end

private
  def self.set_environment
    if ENV['ENVIRONMENT'] == 'test'
      DatabaseConnection.setup('chitter_test')
    else
      DatabaseConnection.setup('chitter')
    end
  end
end
