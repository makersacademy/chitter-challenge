require 'pg'
require './lib/database_connection'

class User

  def self.create(name:, email:, user_name:, password:)
    result = DatabaseConnection.query("INSERT INTO users
      (name, email, user_name, password)
      VALUES('#{name}', '#{email}', '#{user_name}', '#{password}')
      RETURNING id, name, email, user_name;")
    User.new(id: result[0]['id'],
      name: result[0]['name'],
      email: result[0]['email'],
      user_name: result[0]['user_name'])
  end

  attr_reader :id, :name, :email, :user_name

  def initialize(id:, name:, email:, user_name:)
    @id = id
    @name = name
    @email = email
    @user_name = user_name
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(id: result[0]['id'],
      name: result[0]['name'],
      email: result[0]['email'],
      user_name: result[0]['user_name'])
  end

end
