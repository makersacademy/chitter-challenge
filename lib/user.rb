require 'pg'
require_relative 'database_connection'

class User
  def self.create(user_name:, password:)
    result = DatabaseConnection.query("INSERT INTO users (user_name, password) VALUES('#{user_name}', '#{password}') RETURNING id, user_name;")
    User.new(id: result[0]['id'], user_name: result[0]['user_name'])
  end

  attr_reader :id, :user_name

  def initialize(id:, user_name:)
    @id = id
    @user_name = user_name
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(result[0]['id'], result[0]['user_name'])
  end
end