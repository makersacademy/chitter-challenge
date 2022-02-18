# frozen_string_literal: true

require 'bcrypt'
require './lib/database_connection'
require './lib/null_user'

class User
  def self.create(email, password)
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query(
      'INSERT INTO users (email, password) VALUES($1, $2) RETURNING id, email',
      [email, encrypted_password]
    )
    new_user(result)
  end

  def self.find(id)
    return NullUser.new unless id

    result = DatabaseConnection.query(
      'SELECT * FROM users WHERE id = $1', [id]
    )
    new_user(result)
  end

  def self.authenticate(email, password)
    result = DatabaseConnection.query(
      'SELECT * FROM users WHERE email = $1', [email]
    )
    return NullUser.new unless result.any?
    return NullUser.new unless check_password(result, password)

    new_user(result)
  end

  def self.new_user(result)
    User.new(result[0]['id'], result[0]['email'])
  end

  def self.check_password(result, password)
    BCrypt::Password.new(result[0]['password']) == password
  end

  private_class_method :new_user, :check_password

  attr_reader :id, :email

  def initialize(id, email)
    @id = id
    @email = email
  end

  def log_button
    {
      label: 'Log Out',
      name: 'log-out',
      path_action: '/sessions/destroy'
    }
  end
end
