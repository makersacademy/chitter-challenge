require 'pg'
require_relative 'database_connection'

class User

  attr_reader :id, :user_name, :email

  def self.create(user_name:, password:, email:)
    result = DatabaseConnection.query("INSERT INTO users (user_name, password, email) VALUES('#{user_name}', '#{password}', '#{email}') RETURNING id, user_name, email;")
    User.new(id: result[0]['id'], user_name: result[0]['user_name'], email: result[0]['email'])
  end

  def self.find(id:)
    return nil unless id

    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id}")
    User.new(
      id: result[0]['id'],
      user_name: result[0]['user_name'],
      email: result[0]['email']
    )
  end

  def initialize(id:, user_name:, email:)
    @id = id
    @user_name = user_name
    @email = email
  end
end
