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
    
    DBConnection.connect
    result = DBConnection.run_query("INSERT INTO makers (name, user_name, email, password) VALUES($$#{name}$$, $$#{username}$$, $$#{email}$$, $$#{encrypted_password}$$) RETURNING id, name, user_name, email;")
    DBConnection.disconnect

    Maker.new(result[0]['id'], result[0]['name'], result[0]['user_name'], result[0]['email'])
  end

  def self.find_by_id(id)
    DBConnection.connect
    result = DBConnection.run_query("SELECT id, name, user_name, email FROM makers WHERE id=#{id}")
    DBConnection.disconnect

    Maker.new(result[0]['id'], result[0]['name'], result[0]['user_name'], result[0]['email'])
  end

  def self.valid_credentials?(username, password)
    DBConnection.connect
    result = DBConnection.run_query("SELECT id, name, user_name, email, password FROM makers WHERE user_name=$$#{username}$$")
    DBConnection.disconnect

    result.ntuples == 1 && BCrypt::Password.new(result[0]['password']) == password
  end

  def self.find_by_username(username)
    DBConnection.connect
    result = DBConnection.run_query("SELECT id, name, user_name, email FROM makers WHERE user_name=$$#{username}$$")
    DBConnection.disconnect

    Maker.new(result[0]['id'], result[0]['name'], result[0]['user_name'], result[0]['email'])
  end

  private

  def self.valid_new_maker?(username, email)
    DBConnection.connect
    result = DBConnection.run_query("SELECT * FROM makers WHERE email=$$#{email}$$ OR user_name=$$#{username}$$")
    DBConnection.disconnect
    result.ntuples == 1 ? false : true
  end
end
