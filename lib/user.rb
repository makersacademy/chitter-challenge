require './lib/database'
require 'bcrypt'

class User
  attr_reader :id, :email, :password, :realname, :username

  def initialize(id, email, password, realname, username)
    @id = id
    @email = email
    @password = password
    @realname = realname
    @username = username
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map { |user| User.new(user['id'], user['email'], user['password'], user['realname'], user['username']) }
  end

  def self.create(options)
    # encrypt the plantext password, options[:password]
    password = BCrypt::Password.create(options[:password])

    result = DatabaseConnection.query(
      "INSERT INTO users (email, password, realname, username) VALUES(
      '#{options[:email]}',
      '#{password}',
      '#{options[:realname]}',
      '#{options[:username]}'
    ) RETURNING id, email, password, realname, username;"
  )

    User.new(
      result[0]['id'],
      result[0]['email'],
      result[0]['password'],
      result[0]['realname'],
      result[0]['username']
    )
  end

  def self.find(id)

    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(
      result[0]['id'],
      result[0]['email'],
      result[0]['password'],
      result[0]['realname'],
      result[0]['username']
    )
  end

  def self.authenticate(email, password)

    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password

    User.new(
      result[0]['id'],
      result[0]['email'],
      result[0]['password'],
      result[0]['realname'],
      result[0]['username']
    )
end

end
