require 'bcrypt'
require_relative './db_connection'

class Maker
  attr_reader :id, :name, :username, :email

  def initialize(id, name, username, email)
    @id = id
    @name = name
    @username = username
    @email = email
  end

  def self.create(name, username, email, password)
    return nil unless valid_new_maker?(username, email)

    encrypted_password = BCrypt::Password.create(password)
    
    result = DBConnection.query("INSERT INTO makers (name, user_name, email, password) VALUES($$#{name}$$, $$#{username}$$, $$#{email}$$, $$#{encrypted_password}$$) RETURNING id, name, user_name, email;")

    Maker.new(result[0]['id'], result[0]['name'], result[0]['user_name'], result[0]['email'])
  end

  def self.find_by_id(id)
    result = DBConnection.query("SELECT id, name, user_name, email FROM makers WHERE id=#{id}")

    Maker.new(result[0]['id'], result[0]['name'], result[0]['user_name'], result[0]['email'])
  end

  def self.valid_credentials?(username, password)
    result = DBConnection.query("SELECT id, name, user_name, email, password FROM makers WHERE user_name=$$#{username}$$")
    #result.ntuples == 1 && BCrypt::Password.new(result[0]['password']) == password
    result.any? && BCrypt::Password.new(result[0]['password']) == password

  end

  def self.find_by_username(username)
    result = DBConnection.query("SELECT id, name, user_name, email FROM makers WHERE user_name=$$#{username}$$")
    Maker.new(result[0]['id'], result[0]['name'], result[0]['user_name'], result[0]['email'])
  end

  def self.valid_new_maker?(username, email)
    result = DBConnection.query("SELECT * FROM makers WHERE email=$$#{email}$$ OR user_name=$$#{username}$$")
    #result.ntuples.zero?
    !result.any?
  end

  private_class_method :valid_new_maker?
end
