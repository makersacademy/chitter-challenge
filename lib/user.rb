# frozen_string_literal: true

require_relative 'database_connection'
require 'bcrypt'

class User

  def self.create(email:, password:, username:, name:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (email, password, username, name) VALUES ('#{email}', '#{encrypted_password}', '#{username}', '#{name}') RETURNING id, email, username, name;")
    User.new(
      id: result[0]['id'],
      email: result[0]['email'],
      username: result[0]['username'],
      name: result[0]['name']
    )
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?

    User.new(
      id: result[0]['id'],
      email: result[0]['email'],
      username: result[0]['username'],
      name: result[0]['name']
    )
  end

  def self.find(id:)
    return nil unless id

    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id}")
    User.new(
      id: result[0]['id'],
      email: result[0]['email'],
      username: result[0]['username'],
      name: result[0]['name']
    )
  end

  def self.where(user_id:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{user_id};")
    result.map do |_user|
      User.new(
      id: result[0]['id'],
      email: result[0]['email'],
      username: result[0]['username'],
      name: result[0]['name']
    )
    end
  end

  attr_reader :id, :email, :username, :name

  def initialize(id:, email:, username:, name:)
    @id = id
    @email = email
    @username = username
    @name = name
  end
end
