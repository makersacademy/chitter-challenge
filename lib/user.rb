require_relative 'db'
require 'bcrypt'

class User
  attr_reader :id, :email, :name, :username

  def initialize(id:, email:, name:, username:)
    @id = id
    @email = email
    @name = name
    @username = username
  end

  def self.create(email, password, name, username)
    encrypted_pwd = BCrypt::Password.create(password)
    sql = "INSERT INTO users (email, password, name, username) VALUES ('#{email}', '#{encrypted_pwd}', '#{name}', '#{username}') RETURNING id, email, name, username;"
    begin
      result = DB.query(sql)
    rescue StandardError => e
      p e
      return
    end

    User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'], username: result[0]['username'])
  end

  def self.find(id)
    return nil unless id

    sql = "SELECT * FROM users WHERE id='#{id}';"
    result = DB.query(sql)
    User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'], username: result[0]['username'])
  end

  def self.sign_in(email, password)
    sql = "SELECT * FROM users WHERE email='#{email}'"
    result = DB.query(sql)
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password

    User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'], username: result[0]['username'])
  end

  def self.all
    sql = "SELECT * FROM users;"
    result = DB.query(sql)
    result.map do |user|
      User.new(id: user['id'], email: user['email'], name: user['name'], username: user['username'])
    end
  end
end
