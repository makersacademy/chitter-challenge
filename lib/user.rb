# frozen_string_literal: true

require 'database_connection'
require 'null_user'

class User
  def self.create(email, password)
    result = DatabaseConnection.query(
      'INSERT INTO users (email, password) VALUES($1, $2) RETURNING id, email',
      [email, password]
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

  def self.new_user(result)
    User.new(result[0]['id'], result[0]['email'])
  end

  private_class_method :new_user

  attr_reader :id

  def initialize(id, email)
    @id = id
    @email = email
  end
end
