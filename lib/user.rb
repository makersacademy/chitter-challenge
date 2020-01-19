# frozen_string_literal: true

require 'pg'
require './lib/database_connection'

class User
  attr_reader :id, :username, name:, email: 

  def initialize(id:, username:, password:, name:, email:)
    @id = id
    @username = usenrame
    @password = password
    @name = name
    @email = email
  end

  def self.select_username(:username)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}' RETURNING id, username, password, name, email)
    User.new(id: result[0]['id'], username: result[0]['username'], password: result[0]['password'], name: result[0]['name'], email: result[0]['email'] )

  end

  def self.create(:username)
    result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message, created_on;")
    Peep.new(id: result[0]['id'], message: result[0]['message'], created_on: result[0]['created_on'])
  end

end
