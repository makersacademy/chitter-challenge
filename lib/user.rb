require 'pg'
require_relative './database_connection'

class User

  attr_reader :id, :name, :user_name, :email, :password

  def initialize(id:, email:, password:, user_name:, name:)
    @id = id.to_i
    @email = email
    @password = password
    @user_name = user_name
    @name = name
  end

  def self.create(name:, user_name:, email:, password:)
    result = DatabaseConnection.query("INSERT INTO users (email, password, user_name, name)
    VALUES('#{email}', '#{password}', '#{user_name}', '#{name}') RETURNING id, email, password, user_name, name;")
      User.new(id: result[0]['id'], email: result[0]['email'], password: result[0]['password'], user_name: result[0]['user_name'], name: result[0]['name'])
  end

  def self.all
    users = DatabaseConnection.query("SELECT * FROM users;")
    users.map do |user|
      User.new(id: user['id'], email: user['email'], password: user['password'], user_name: user['user_name'], name: user['name'])
    end
  end

  def self.find(id)
    users = DatabaseConnection.query("SELECT * FROM users where id=#{id};")
    users.map do |user|
      User.new(id: user['id'], email: user['email'], password: user['password'], user_name: user['user_name'], name: user['name'])
    end
  end

end
