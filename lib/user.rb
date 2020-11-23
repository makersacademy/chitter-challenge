require_relative 'database_connection'

class User
  attr_reader :id, :username

  def initialize(id:, username:)
    @id = id
    @username = username
  end

  def self.create(username:, email:, password:)
    entry = DatabaseConnection.query(
      "INSERT INTO users (username, email, password)
       VALUES('#{username}', '#{email}', '#{password}')
       RETURNING id, username;")

    User.new(id: entry[0]['id'], username: entry[0]['username'])
  end

  def self.find(id:)
    return nil unless id

    search = DatabaseConnection.query(
      "SELECT *
        FROM users
       WHERE id = #{id};")

    User.new(id: search[0]['id'], username: search[0]['username'])
  end
end
