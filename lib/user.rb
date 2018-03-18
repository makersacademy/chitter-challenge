require_relative 'database_connection'
require 'bcrypt'

class User
  attr_reader :id, :name, :username, :email, :password

  def initialize(id, name, username, email, password)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.create(options)
    password = BCrypt::Password.create(options[:password])
    result = DatabaseConnection.query(
    "INSERT INTO users(name, username, email, password)
    VALUES (
      '#{options[:name]}', '#{options[:username]}',
      '#{options[:email]}', '#{password}')
    RETURNING id, username
    ;")[0]

    User.build(result)
  end

  def self.all
    results = DatabaseConnection.query('SELECT * FROM users')
    results.map { |user| User.build(user) }
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query(
    "SELECT * FROM users WHERE id = '#{id}';")[0]

    User.build(result)
  end

  def self.authenticate(email, password)
    result = DatabaseConnection.query(
    "SELECT * FROM users
    WHERE email = '#{email}'
    ;")

    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password

    User.build(result[0])
  end

  def self.build(result)
    User.new(
      result['id'], result['name'], result['username'],
      result['email'], result['password']
    )
  end
end
