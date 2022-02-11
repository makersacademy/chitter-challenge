# frozen_string_literal: true

require 'database_connection'

class User
  def self.create(email, password)
    result = DatabaseConnection.query(
      'INSERT INTO users (email, password) VALUES($1, $2) RETURNING id, email',
      [email, password]
    )
    User.new(result[0]['id'], result[0]['email'])
  end

  attr_reader :id

  def initialize(id, email)
    @id = id
    @email = email
  end
end
