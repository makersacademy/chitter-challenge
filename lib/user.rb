require 'pg'
require_relative '../database_connection_setup.rb'

class User

  attr_reader :user_id, :username

  def initialize(username:, user_id:)
    @user_id = user_id
    @username = username
  end

  def self.create(username:, password:)
    result = DatabaseConnection.query(
      "INSERT INTO users (username, password) VALUES ($1, $2) RETURNING id, username;",
      [username, password]
    )
    User.new(username: result[0]['username'], user_id: result[0]['id'])
  end

end