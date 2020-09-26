require 'pg'
require_relative './database_connection.rb'

class Users

  attr_reader :id, :name, :email, :password, :username

  def self.create(name:, email:, password:, username:)
    Users.set_environment

    @connection = DatabaseConnection.connection

    result = DatabaseConnection.query("INSERT INTO users (name, email, password, username) VALUES('#{name}', '#{email}', crypt('#{password}', gen_salt('bf')), '#{username}')RETURNING id, name, email, password, username;")
    
    Users.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], password: result[0]['password'], username: result[0]['username'])
  end

  def initialize(id:, name:, email:, password:, username:)
    @id = id
    @name = name
    @password = password
    @username = username
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
