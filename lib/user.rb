require_relative '../database_connection_setup'

class User
  attr_reader :id, :name, :username, :email

  def initialize(id:, name:, username:, email:)
    @id = id
    @name = name
    @username = username
    @email = email
  end

  def self.find_id(username)
    result = DatabaseConnection.query("SELECT id FROM users
                                      WHERE username='#{username}';")
    result.first['id'].to_i
  end

  def self.create(name:, username:, email:, password:)
    result = DatabaseConnection.query("INSERT INTO users(name, username,
                                      email_address, password)
                                      VALUES('#{name}', '#{username}',
                                             '#{email}', '#{password}')
                                      RETURNING id, name, username,
                                      email_address;")
  end

  def self.details(user_id:)
    result = DatabaseConnection.query("SELECT id, name, username, email_address
                                      FROM users WHERE id = '#{user_id}'")
    result.map do |detail|
      User.new(id: detail['id'], name: detail['name'],
               username: detail['username'], email: detail['email'])
    end
  end
end
