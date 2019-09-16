require 'pg'
require_relative './database_connection'

class ChitterUser

  attr_reader :id, :email, :username

  def initialize(id:, email:, username:, name:, password:)
    @id = id
    @email = email
    @username = username
    @name = name
    @password = password
  end

  def self.add(email:, username:, name:, password:)
    r = DatabaseConnection.query("INSERT INTO chitter_users (email, username,
      name, password) VALUES ('#{email}', '#{username}', '#{name}',
        '#{password}') RETURNING id, email, username, name, password;")
    ChitterUser.new(id: r[0]['id'], email: r[0]['email'],
      username: r[0]['username'], name: r[0]['name'], password: r[0]['password'])
  end
end
