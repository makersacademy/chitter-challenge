# frozen_string_literal: true

require_relative 'database_connection'

class User
  def self.create(username:, email:, password:)
    user = DatabaseConnection.query("INSERT INTO users (username, email, password) VALUES('#{username}', '#{email}', '#{password}') RETURNING id, username, email, password").first
    create_object(user)
  end

  def self.find_by_id(id:)
    user = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id}").first
    create_object(user)
  end

  class << self
    private

    def create_object(user)
      User.new(
        id: user['id'],
        username: user['username'],
        email: user['email'],
        password: user['password']
      )
    end
  end

  attr_reader :id, :username, :email, :password

  def initialize(id:, username:, email:, password:)
    @id = id
    @username = username
    @email = email
    @password = password
  end

end
